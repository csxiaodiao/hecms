# frozen_string_literal: true

Hecms::Engine.routes.draw do
  devise_for :users, path: 'auth/users', class_name: 'Hecms::User', module: :devise, controllers: {
    sessions: 'hecms/auth/sessions',
    passwords: 'hecms/auth/passwords'
  }

  root to: 'categories#index'

  resources :categories
  resources :articles
  resources :tags

  resources :pictures, only: [:create]
  resources :uploads, only: [:create]
  resources :locales, only: [:update]
end
