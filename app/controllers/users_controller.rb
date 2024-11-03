class UsersController < ApplicationController  
  # Following is psuedocode, doesn't actually work
  # def login(email, password):
  #   @user = User.find_by(params[:email])
  #   if @user.present? && password_correct?(password)
  #     redirect_to(login)
  #   end

  # def password_correct?(password):
  #   if @user.password == password:
  #     return True
  #   else
  #     render(registration)
  #     return False
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, flash: { success: 'Created user successfully' }
    else
      render :new, flash: {alert: "Failed to create user"}
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :fname, :lname, :phone)
  end
end
