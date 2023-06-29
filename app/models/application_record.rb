class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
    def create
      lease = Lease.new(lease_params)
  
      if lease.save
        render json: lease
  
