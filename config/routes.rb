Rails.application.routes.draw do
  
    # Apartments routes
    resources :apartments, except: [:new, :edit]
    resources :tenants, except: [:new, :edit]
  
end
