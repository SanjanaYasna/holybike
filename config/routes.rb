Rails.application.routes.draw do
  get 'users/signup', to: 'users#create'
  get 'users/login'
  #root to: 'pages#index'
  resources :registrations, only: [:new,:create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'pages#placeholder'
end
