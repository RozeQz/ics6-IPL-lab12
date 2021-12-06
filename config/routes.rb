Rails.application.routes.draw do
  root 'palindromes#index'
  get 'session/login'
  post 'session/create'
  get 'session/logout'
  resources :users
  resources :palindromes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
