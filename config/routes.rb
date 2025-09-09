Rails.application.routes.draw do
  resources :tags
  resources :tag_categories
  devise_for :users
  resources :characters
  resources :prompts
  resources :relationships, only: [:create]
  resources :traits, only: [:index]
  resources :character_traits, only: [:create]
  
  # Font demo route (remove after testing)
  get "font-demo" => "application#font_demo", as: :font_demo
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "prompts#index"
end
