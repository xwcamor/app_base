class Accounts::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile_id, user_attributes: [:name, :lastname, :cellphone]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile_id, user_attributes: [:name, :lastname, :cellphone]])
  end

  def build_resource(hash = {})
    super
    resource.build_user if resource.user.nil?
  end

  def update_resource(resource, params)
    resource.update_with_password(params)
  end
end