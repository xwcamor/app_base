class Position < ApplicationRecord
  # Relatiohships
  has_many :employees

  # Upload Image
  mount_uploader :image, ImageUploader
  
  # Validations
  # Important! - Change values according the model
  validates :name, presence: true, uniqueness: { case_sensitive: false, conditions: -> { where(deleted: '0') },
   message: ->(object, data) { I18n.t('activerecord.errors.models.#{model_name.i18n_key}.attributes.name.taken') } }

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
  
  # Sobrecargar full_messages para eliminar el nombre del atributo
  def self.human_attribute_name(attr, options = {})
    ''
  end
  
  # Important! - Change values according the model
  def self.ransackable_attributes(auth_object = nil)
    %w[id name active deleted created_at updated_at]
  end

  # Important! - Change values according the model
  def self.ransackable_associations(auth_object = nil)
    %w[employees]
  end
  
  # Callbacks
  private
  
  # Set values for new records
  def save_default_values
    self.active  = true 
    self.deleted = false  
  end 

end