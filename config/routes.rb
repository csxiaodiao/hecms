# frozen_string_literal: true

Hecms::Engine.routes.draw do
  devise_for :users, path: 'auth/users', class_name: 'Hecms::User', module: :devise, controllers: {
    sessions: 'hecms/auth/sessions',
    passwords: 'hecms/auth/passwords'
  }

  root to: 'categories#index'

  resources :categories
end
