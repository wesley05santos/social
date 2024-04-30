Rails.application.routes.draw do
  resources :chats
  resources :articles
  devise_for :users
  root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'search', to: 'search#index'
  post 'follow', to: 'users#follow'
  delete 'unfollow', to: 'users#unfollow'

  # Defines the root path route ("/")
  # root "posts#index"
end
