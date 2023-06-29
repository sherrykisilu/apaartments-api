class LeasesController < ApplicationController
  def create
    lease = Lease.new(lease_params)

    if lease.save
      render json: lease, status: :created
    else
      render json: lease.errors, status: :unprocessable_entity
    end
  end

  def destroy
    # Your destroy action logic here
  end

  private

  def lease_params
    params.require(:lease).permit(:rent)
  end
end
