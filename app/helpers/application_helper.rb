module ApplicationHelper

  def dynamic_title
    controller_name = controller.controller_name
    I18n.t("#{controller_name}.title_plural", default: controller_name.humanize)
  end
  
  # Helper used based on controller
  def dynamic_translation(key)
    controller_name = controller.controller_name
    I18n.t("#{controller_name}.#{key}", default: key.humanize)
  end

  def language_selector
    languages = Language.where("active = 1 AND deleted = 0")
    languages.map do |language|
      link_to update_locale_path(locale: language.locale), class: 'dropdown-item' do
        content_tag(:div, class: 'media') do
          concat content_tag(:span, '', class: "flag-icon flag-icon-#{language.flag} img-size-50 mr-3 img-circle")
          concat(content_tag(:div, class: 'media-body') do
            concat content_tag(:h3, language.name, class: 'dropdown-item-title')
          end)
        end
      end
    end.join.html_safe
  end

end