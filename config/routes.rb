Rails.application.routes.draw do
  # Apartments routes
  resources :apartments, except: [:new, :edit]

  # Tenants routes
  resources :tenants, except: [:new, :edit]

  # Leases routes
  resources :lease, only: [:create, :destroy]
end
