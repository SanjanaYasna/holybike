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
# Adding/Fixing Links (Time: 1 hour)
## Signup/Login Links 
### 1. Changes to views/users/login.html.erb
- Commented out flash notice in views/users/login.html.erb
- Changed name of password field to :pword not :password
```ruby:
    <div class="field">
        <%= f.label :password %><br/>
        <%= f.password_field :pword, autocomplete: "new-password" %>
      </div>
``` 
- (Teetly) Flash is no longer commented out, since I have worked in resolving flash module middleware configurations and things did appear to work on Camille's 
end in getting login and signup pages to appear properly 

- Changed ```link_to 'users/signup'``` to  ```<%= link_to "Create an account", users_signup_path %>```
### 2. Changes to views/users/signup.html.erb
- Changed ```<li><a href="login">VB Login</a></li>``` to  ```<li><%= link_to "VB Login", users_login_path%></li>```
- Changed ```<li><a href="home">Valley Bike </a></li>``` to ```<li><%= link_to "Valley Bike", root_path%></li>```
- Help and Contact Us are the same for now
## Images in Map Page
### 1. Changing absolute links to relative links
- In views/pages/index.html.erb all image src links were switched from:
``` <a><img src="styles/imgs/name.png" style="width: 50px; height: 40px;"/></a>```
to 
```<%= image_tag 'name.png', style: 'width: 50px; height: 40px;', alt: 'name' %>```
- This will let rails search anywhere in assests/images for the image. If we decide to sort the images into folders within assets/images, these links won't need to be changes