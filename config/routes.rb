Rails.application.routes.draw do
  get 'users/signup'
  get 'users/login'
  root to: 'pages#index'
end
