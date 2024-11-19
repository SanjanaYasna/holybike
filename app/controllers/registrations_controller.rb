class RegistrationsController < ApplicationController
  skip_before_action :authorize
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
      logger.debug "Regsitration Failed: User attributes hash: #{@user.attributes.inspect}"
      render :new
    end
  end

  
  private

  def user_params
    #identifier kept for now in case of future increment operations for better sessions tracking (for now, sessions do work and do get destroyed once you leave)
    params.require(:user).permit(:email, :password, :fname, :lname, :phone, :identifer)
  end
end