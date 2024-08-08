class User < ApplicationRecord
  belongs_to :account

  #after_initialize :set_default_locale, if: :new_record?

  # Ransack configuration
  def self.ransackable_attributes(auth_object = nil)
    %w[id account_id name lastname cellphone created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def set_default_locale
    if account && account.language
      I18n.locale = account.language.locale
      session[:locale] = I18n.locale
    end
  end

  
  def full_name
    "#{name}  #{lastname}"
  end  
end