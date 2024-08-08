class ProfileAccess < ApplicationRecord
  # Relatiohships	
  belongs_to :profile
  belongs_to :access

  #validates :profile_id, presence: true
  validates :access_id, presence: true
end