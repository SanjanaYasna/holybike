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
  
  # Payments in payments folder with payments_controller.rb
  resources :payments

  #404 page added as our lord and savior
  post 'render_404', to: 'application#render_404'

  resources :rentals, only: [:new, :pass_bike_and_station_to_form]

  #payments specific
  resources :payments, only: [:new, :create]

  #user profile page
  get '/users/:id', to: 'users#profile', as: "user"

  #discounts page
  get '/discounts', to: 'pages#discounts'
end

#registrations/new <-create user for signup
#sessions/new <-create user for login (and with session check, session entered)
#CAMILLE"S ROUTES, TO BE ADJUSTED
# get 'users/signup', to: 'users#create'
# get 'users/login'
# #root to: 'pages#index'

# root to: 'pages#placeholder'
