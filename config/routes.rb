Rails.application.routes.draw do
  get 'users/signup', to: 'users#create'
  get 'users/login'
  #login and signup specific
  resources :registrations, only: [:new,:create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'pages#placeholder'

  #bikes and statoins specific
  resources :bikes,     only: [:index]
  resources :stations,  only: [:index]
  #set root_path
end

#registrations/new <-create user for signup
#registrations/create <-signup
#sessions/create <-login
#sessions/new <-create user for app
#CAMILLE"S ROUTES, TO BE ADJUSTED
# get 'users/signup', to: 'users#create'
# get 'users/login'
# #root to: 'pages#index'

# root to: 'pages#placeholder'
