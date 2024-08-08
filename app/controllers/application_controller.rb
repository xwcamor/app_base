class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_default_values, if: :account_signed_in?, except: [:update_locale]
  before_action :set_settings
  before_action :set_locale

  layout :layout_by_resource

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def update_locale
    language = Language.find_by(locale: params[:locale])
    if language
      I18n.locale = language.locale
      session[:locale] = language.locale
      session[:flag] = language.flag
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def layout_by_resource
    if devise_controller?
      "login"
    elsif account_signed_in?
      "admin"
    else
      "web"
    end
  end

  def after_sign_in_path_for(resource)
    if resource.respond_to?(:language)
      I18n.locale = resource.language.locale
      session[:locale] = resource.language.locale
      session[:flag] = resource.language.flag
    end
    super(resource)
  end

  def authorize!(action, resource)
    unless current_account.has_permission?(action, resource)
      redirect_to admin_dashboard_index_path
    end
  end

  def set_settings
    app_setting = Setting.first
    @app_name = app_setting.name
    @app_logo = app_setting.logo_url
    @body_config = app_setting.body_config
  end

  def set_time_zone(&block)
    time_zone = current_account.try(:time_zone) || 'UTC'
    Time.use_zone(time_zone, &block)
  end

  def set_default_values
    set_main_model
    set_permissions
    set_titles_and_urls unless controller_name == 'sessions'
  end

  def set_main_model
    raise NotImplementedError, "Debe implementar set_main_model en el controlador específico"
  end

  def set_permissions
    @permissions = current_account.profile.profile_accesses.joins(:access)
                      .select('accesses.action_name, accesses.resource_name')
                      .group_by(&:resource_name)
    @permissions.transform_values! { |accesses| accesses.map(&:action_name) }

    # Añadir depuración para mostrar los permisos cargados
    #Rails.logger.debug "Permisos cargados para #{current_account.username}: #{@permissions.inspect}"
  end

  def set_titles_and_urls
    @main_url = url_for(controller: controller_name, only_path: true) unless controller_name == 'sessions'
    @plural_title = I18n.t("#{controller_name}.title_plural")
    @singular_title = I18n.t("#{controller_name}.title_singular")
  end
end
