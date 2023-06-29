class Tenant < ApplicationRecord
    has_many :apartments, through: :leases
    has_many :leases
end
