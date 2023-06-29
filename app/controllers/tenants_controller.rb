class TenantsController < ApplicationController
    before_action :set_tenant, only: [:show, :update, :destroy]
 
    def index
      render json: Tenant.all
    end
  
    def show
      render json: @tenant
    end
  
    def create
      render json: Tenant.create(tenant_params), status: :created
    end
  
    def update
      render json: @tenant.update(tenant_params) ? @tenant : @tenant.errors, status: :unprocessable_entity
    end
  
    def destroy
      @tenant.destroy
      head :no_content
    end
  
    private
  
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end
  
    def tenant_params
      params.require(:tenant).permit(:name, :age)
    end
end
  