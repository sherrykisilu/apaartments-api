class Apartment < ApplicationRecord
    has_many :tenants, through: :leases
    has_many :leases
  
    validates :number, presence: true
  end