class Access < ApplicationRecord
  # Relatiohships
  has_many :profile_accesses
  has_many :profiles, through: :profile_accesses
  
  # Validations
  validates :resource_name, presence: true
  validates :action_name, presence: true

  # Pagination Kaminari
  paginates_per 10

  def full_access_name
    "#{resource_name} - #{action_name}"
  end

  # Sobrecargar full_messages para eliminar el nombre del atributo
  def self.human_attribute_name(attr, options = {})
    ''
  end
  
  # Important! - Change values according the model
  def self.ransackable_attributes(auth_object = nil)
    %w[id resource_name action_name created_at updated_at]
  end

  # Important! - Change values according the model
  def self.ransackable_associations(auth_object = nil)
    %w[profile_accesses]
  end

end