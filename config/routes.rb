Spotz::Application.routes.draw do
  resources :activities
  resources :acts
  resources :locations
  devise_for :users
  
  root to: "acts#index"
end
