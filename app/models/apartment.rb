class Apartment < ApplicationRecord
    has_many :tenants, through: :leases
    has_many :leases
    def index
        apartments = Apartment.all
        render json: apartments
      end
    
      def show
        apartment = Apartment.find(params[:id])
        render json: apartment
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Apartment not found' }, status: :not_found
      end
    
      def create
        apartment = Apartment.new(apartment_params)
    
        if apartment.save
          render json: apartment, status: :created
        else
          render json: { errors: apartment.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def update
        apartment = Apartment.find(params[:id])
    
        if apartment.update(apartment_params)
          render json: apartment
        else
          render json: { errors: apartment.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Apartment not found' }, status: :not_found
      end
    
      private
    
      def apartment_params
        params.require(:apartment).permit(:number)
      end
    end
    Save the changes to the apartments_controller.rb file.
    Now, the controller actions are in the correct file, and you should be able to handle the API requests for the Apartment model properly.
    
    
    
    
    
    
    Regenerate response    
        