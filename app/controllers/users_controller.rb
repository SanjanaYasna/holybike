class UsersController < ApplicationController  
  # Following is psuedocode, doesn't actually work
  # def login(email, password):
  #   @user = User.find_by(params[:email])
  #   if @user.present? && password_correct?(password)
  #     redirect_to(login)
  #   end

  # def password_correct?(password):
  #   if @user.pword == password:
  #     return True
  #   else
  #     render(registration)
  #     return False
end
