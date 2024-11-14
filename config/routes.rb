Rails.application.routes.draw do
  get 'users/signup'
  get 'users/login'
  root to: 'pages#home'
  get 'pages/main'

  resources :bikes,     only: [:index]
  resources :stations,  only: [:index, :show]
end
