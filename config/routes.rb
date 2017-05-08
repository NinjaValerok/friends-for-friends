Rails.application.routes.draw do
  get 'feed/index'

  resources :users
  root to: 'feed#index', via: :get
  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'users#login'
end
