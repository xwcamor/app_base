class Sale < ApplicationRecord
  # Relationships
  belongs_to :employee
  belongs_to :customer
  belongs_to :type_payment
  belongs_to :report_payment
  belongs_to :account
  has_many :sale_details, dependent: :destroy
  accepts_nested_attributes_for :sale_details, allow_destroy: true

  # Validations
  validate :must_have_at_least_one_sale_detail
    
  # Scopes
  scope :not_deleted, -> { where(deleted: false) }
  scope :created_today, -> { where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_this_month, -> { where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month) }
  scope :created_this_year, -> { where(created_at: Time.zone.now.beginning_of_year..Time.zone.now.end_of_year) }
  scope :canceled, -> { where(deleted: true) }

  # Pagination Kaminari
  paginates_per 10

  # Actions from callbacks
  before_save :save_default_values, :if => :new_record?

  # Methods
  def sub_total
    sale_details.sum { |detail| detail.quantity * detail.product.unit_price }
  end

  def discount_total
    # Assuming you have a discount field in sale_details
    sale_details.sum(&:discount)
  end

  def total_payment
    sub_total - discount_total
  end


  
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

  def must_have_at_least_one_sale_detail
    if sale_details.reject(&:marked_for_destruction?).empty?
      errors.add(:base, 'Debe existir al menos 1 producto')
    end
  end
end