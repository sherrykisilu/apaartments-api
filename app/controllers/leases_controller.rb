class LeasesController < ApplicationController
  before_action :set_lease, only: [:destroy]

  def create
    @lease = Lease.new(lease_params)

    if @lease.save
      render json: @lease, status: :created
    else
      render json: @lease.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @lease.destroy
    head :no_content
  end

  private

  def set_lease
    @lease = Lease.find(params[:id])
  end

  def lease_params
    params.require(:lease).permit(:rent, :apartment_id, :tenant_id)
  end
end
