Rails.application.routes.draw do
  #resources :resources
  #resources :zones
  resources :cities

  
  root 'cities#index'
  get '/contact_us', to: 'static_pages#contact_us'
  #get 'static_pages#contact_us'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
