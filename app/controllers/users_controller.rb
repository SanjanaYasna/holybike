class UsersController < ApplicationController  
  skip_before_action :authorize, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: 'Created user successfully' }
    else
      render :new, flash: {alert: "Failed to create user"}
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :fname, :lname, :phone)
  end

  def profile
    @user= User.find_by(id: session[:user_id])
    @rentals = Rental.where(user_id: @user.id)
  end
end