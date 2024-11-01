# class UsersController < ApplicationController  
#   # Following is psuedocode, doesn't actually work
#   # def login(email, password):
#   #   @user = User.find_by(params[:email])
#   #   if @user.present? && password_correct?(password)
#   #     redirect_to(login)
#   #   end

#   # def password_correct?(password):
#   #   if @user.pword == password:
#   #     return True
#   #   else
#   #     render(registration)
#   #     return False
# end

class UsersController < ApplicationController
  skip_before_action :authorize, only: :create

  def create
      user = User.create!(user_params)
      session[:user_id] = user.id
      render json: user, status: :created
  end

  def show
      render json: @current_user
  end

  private

  #not sure is this is right and passes in right number of params
  def user_params
      params.permit(:fname,:lname, :email, :phone, :pword)
  end
end
