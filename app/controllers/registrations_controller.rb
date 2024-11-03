class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Registration successful' 
      redirect_to new_session_path
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  
  private

  def user_params
    params.require(:user).permit(:email, :password, :fname, :lname, :phone)
  end
end
