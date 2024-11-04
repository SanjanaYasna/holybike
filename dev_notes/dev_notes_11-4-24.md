Camille

# Main Page Placeholder (Time: 1 hour)
Add main page that links to login, signup, and map page. The link to the map page is only for demo purposes.


### 1. Added pages/main.html.erb
The only functional parts are the links to the map, signup and login pages. I tried to set it up with div classes that would make it easier to style with css later

Based on the figma main page, with a top and bottom section and a navbar partial commented out (navbar partial hasn't been made yet)
    
    ```ruby:
    <%= render 'pages/navbar' %>
    ```

### 2. Added to pages_controller.rb
```ruby:
  def main
    render :main
  end
```

### 3. Changed root from being the map page to being the placeholder main.
```ruby:
Rails.application.routes.draw do
  get 'users/signup'
  get 'users/login'
  root to: 'pages#main' # Placeholder main
  get 'pages/index' # Map

  resources :bikes,     only: [:index]
  resources :stations,  only: [:index]
end
```
# Adding/Fixing Links (TODO) (Time: ?)


## Signup/Login Links (TODO)

## Images in Map Page (TODO)