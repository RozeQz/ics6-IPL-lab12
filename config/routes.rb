# frozen_string_literal: true

Rails.application.routes.draw do
  root 'palindromes#input'
  get 'palindromes/input'
  get 'palindromes/view'
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  resources :users, only: %i[index show new create edit update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
