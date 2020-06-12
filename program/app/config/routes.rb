Rails.application.routes.draw do
  resources :resources
  resources :cities do
    member do
      post :create_via_search
    end
  end
  resources :zones
  
  root 'cities#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
