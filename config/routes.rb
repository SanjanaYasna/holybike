Rails.application.routes.draw do
  get 'users/signup', to: 'users#create'
  get 'users/login'
  root to: 'pages#placeholder'
 # get 'pages/index'

  resources :bikes,     only: [:index]
  resources :stations,  only: [:index]
  resources :registrations, only: [:new,:create]
  resources :sessions, only: [:new, :create, :destroy]
  
  
  #post route for user signup , calling users_controller.rb create method
  # post 'users/signup', to: 'users#create' #create user session from user-controller.rb, else if login, below show whether user is authorized
  # #login should create a session
  # post 'users/login', to: 'sessions#create'
  # #TO DO: session destruction for logout
  # post 'users/logout', to: 'sessions#destroy'

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
