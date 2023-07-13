Rails.application.routes.draw do
  resources :runners
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  mount ReplicateRails::Engine => "/replicate/webhook"
  
  # Defines the root path route ("/")
  # root "articles#index"
end
