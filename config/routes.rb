Rails.application.routes.draw do
  get 'users/signup'
  get 'users/login'
  root to: 'pages#main'
  get 'pages/index'

  resources :bikes,     only: [:index]
  resources :stations,  only: [:index]
  
  #post route for user signup , calling users_controller.rb create method
  post 'users/signup', to: 'users#create' #create user session from user-controller.rb, else if login, below show whether user is authorized
  #login should create a session
  post 'users/login', to: 'sessions#create'
  #TO DO: session destruction for logout
  post 'users/logout', to: 'sessions#destroy'
end
