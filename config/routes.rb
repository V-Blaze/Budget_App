Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :expenses, only: [:index, :new, :create, :destroy]
  resources :categories, only: [:index, :new, :create, :destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
