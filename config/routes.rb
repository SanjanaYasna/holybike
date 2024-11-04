Rails.application.routes.draw do
  get 'users/signup'
  get 'users/login'
  root to: 'pages#main'
  get 'pages/index'

  resources :bikes,     only: [:index]
  resources :stations,  only: [:index]
end
