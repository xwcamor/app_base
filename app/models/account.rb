class Account < ApplicationRecord
  # Devise Configuration
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
         
  # Relatiohships
  belongs_to :language
  belongs_to :country
  belongs_to :profile  
  has_one :user, dependent: :destroy

  # Nested Attributes
  accepts_nested_attributes_for :user

  # Upload Image
  mount_uploader :image, ImageUploader

  # Validations
  # Important! - Change values according the model
  validates :username, presence: true, uniqueness: { case_sensitive: false, conditions: -> { where(deleted: '0') },
   message: ->(object, data) { I18n.t('activerecord.errors.models.#{model_name.i18n_key}.attributes.username.taken') } }

  # Scopes
  scope :not_deleted, -> { where(deleted: false) }

  # Pagination Kaminari
  paginates_per 10

  # Actions from callbacks
  before_save :save_default_values, :if => :new_record?

  # Crate String Active Status for display on view as span
  def active_status
    if active
      '<span class="badge bg-olive">'.html_safe  + I18n.t('standard.active') + '</span>'.html_safe
    else
      '<span class="badge bg-danger">'.html_safe + I18n.t('standard.blocked') + '</span>'.html_safe
    end
  end
  
  # Crate String Active Status for display on view as simple text
  def active_status_text
    if active
      I18n.t('standard.active')
    else
      I18n.t('standard.blocked')
    end
  end
 
  # Sobrescribir active_for_authentication? para añadir lógica personalizada
  def active_for_authentication?
    super && !deleted && active
  end

  # Método para mostrar un mensaje de error personalizado
  def inactive_message
    !deleted ? super : :deleted_account
  end

  # Permissions by access
  def has_permission?(action_name, resource_name)
    self.class.with_silent_logging do
      profile.profile_accesses.includes(:access).where(accesses: { action_name: action_name, resource_name: resource_name }).exists?
    end
  end

  # Sobrecargar full_messages para eliminar el nombre del atributo
  def self.human_attribute_name(attr, options = {})
    ''
  end
  
  # Important! - Change values according the model
  def self.ransackable_attributes(auth_object = nil)
    %w[id username email profile_id language_id country_id active deleted created_at updated_at]
  end

  # Important! - Change values according the model
  def self.ransackable_associations(auth_object = nil)
    %w[user profile language country]
  end
  
  # Callbacks
  private

  # Definir with_silent_logging como un método de clase
  def self.with_silent_logging
    previous_level = ActiveRecord::Base.logger.level
    ActiveRecord::Base.logger.level = Logger::WARN
    result = yield
    ActiveRecord::Base.logger.level = previous_level
    result
  end
  
  # Set values for new records
  def save_default_values
    self.active  = true
    self.deleted = false
  end

end