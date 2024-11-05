class UsersController < ApplicationController
  #skip_before_action :authorize, only: :create
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    session[:user_id] = @user.id
    if @user.save
      redirect_to root_path, notice: "Successfully created account!"

    else
        render json: @user, status: :created
    end
  end

  private
  def user_params
    params.permit(:fname,:lname, :email, :phone, :password)
  end

#   def create
#       user = User.create!(user_params)
#       session[:user_id] = user.id
#       render json: user, status: :created
#   end

#   def show
#       render json: @current_user
#   end

#   private

#   #not sure is this is right and passes in right param naming conventions
#   def user_params
#       params.permit(:fname,:lname, :email, :phone, :password)
#   end
end
