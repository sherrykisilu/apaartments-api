class Apartment < ApplicationRecord
    has_many :tenants, through: :leases
    has_many :leases
   validates :number, presence: true

     apartment = Apartment.new(apartment_params)
      
          if apartment.save
            render json: apartment, status: :created
          else
            render json: { errors: apartment.errors.full_messages }, status: :unprocessable_entity
          end
      
        private
      
        def apartment_params
          params.require(:apartment).permit(:number)
        end
   
end
