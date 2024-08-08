class SaleDetail < ApplicationRecord
  # Relatiohships	
  belongs_to :sale
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end