Rails.application.routes.draw do
  root to: "stations#index"
  get 'users/signup'
  get 'users/login'
end
