Rails.application.routes.draw do
  resources :chat_messages
  root 'home#index'
  resources :chats, only: %i[ index create show ]
  resources :articles
  devise_for :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'search_user', to: 'search#search_user'
  get 'search_article', to: 'search#search_article'
  get 'http:/localhost:3000/search_article', to: 'search#search_article'

  post 'link_logout', to: 'home#link_logout'
  put 'load_more_messages', to: 'chat_messages#load_more_messages'
  post 'follow', to: 'users#follow'
  delete 'unfollow', to: 'users#unfollow'

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      resources :articles
      resources :chats
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
    end
  end
end

