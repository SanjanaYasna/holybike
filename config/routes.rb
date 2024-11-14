Rails.application.routes.draw do
  get 'users/signup', to: 'users#create'
  get 'users/login'
  #login and signup specific
  resources :registrations, only: [:new,:create]
  resources :sessions, only: [:new, :create, :destroy]
  #main page upon logging in and having an authorized session
  root to: 'pages#placeholder'
  get 'pages#placeholder', to: 'stations_controller#render_stations_in_pages'

  #logout, redirects to sign in page
  delete '/sessions', to: 'sessions#destroy'

  #bikes and statoins specific
  resources :bikes,     only: [:index]
  resources :stations,  only: [:index, :show, :render_stations_in_pages]

end

#registrations/new <-create user for signup
#sessions/new <-create user for login (and with session check, session entered)
#CAMILLE"S ROUTES, TO BE ADJUSTED
# get 'users/signup', to: 'users#create'
# get 'users/login'
# #root to: 'pages#index'

# root to: 'pages#placeholder'
