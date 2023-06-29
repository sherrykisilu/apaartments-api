Rails.application.routes.draw do

    # Apartments routes
    resources :apartment, except: [:new, :edit]
    resources :tenant, except: [:new, :edit]
  
end
