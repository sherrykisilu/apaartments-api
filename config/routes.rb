Rails.application.routes.draw do
  # Apartments routes
  resources :apartment, except: [:new, :edit]

  # Tenants routes
  resources :tenant, except: [:new, :edit]

  # Leases routes
  resources :lease, only: [:create, :destroy]
end
