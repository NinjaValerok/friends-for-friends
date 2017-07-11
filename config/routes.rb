# frozen_string_literal: true

Rails.application.routes.draw do
  get 'feed/index'
  get 'feed/update'
  root to: 'feed#index', via: :get

  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' },
             skip: [:registrations]

  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    patch 'users/:id' => 'devise/registrations#update', :as => 'user_registration'
  end

  # devise_scope :user do
  #   delete "/users/sign_out" => "devise/sessions#destroy"
  # end
end
