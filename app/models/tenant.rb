class Tenant < ApplicationRecord
  has_many :apartments, through: :leases
  has_many :leases
  validates :name, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  
  # Index action to fetch all tenants
  def index
    tenants = Tenant.all
    render json: tenants
  end

  # Show action to fetch a specific tenant
  def show
    tenant = Tenant.find(params[:id])
    render json: tenant
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Tenant not found' }, status: :not_found
  end

  # Create action to create a new tenant
  def create
    tenant = Tenant.new(tenant_params)

    if tenant.save
      render json: tenant, status: :created
    else
      render json: { errors: tenant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Update action to update an existing tenant
  def update
    tenant = Tenant.find(params[:id])

    if tenant.update(tenant_params)
      render json: tenant
    else
      render json: { errors: tenant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Destroy action to delete a tenant
  def destroy
    tenant = Tenant.find(params[:id])
    tenant.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Tenant not found' }, status: :not_found
  end

  private

  # Strong parameters for tenant creation and update
  def tenant_params
    params.require(:tenant).permit(:name, :age)
  end



end

