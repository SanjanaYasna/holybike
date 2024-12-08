class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create, :success]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user&.authenticate(params[:user][:password]) 
      logger.debug "Login successful. User attributes hash: #{@user.attributes.inspect}"
      session[:user_id] = @user.id
      flash[:success] = 'Login successful'
      redirect_to root_path
    else
      @user = User.new(email: params[:user][:email]) 
      flash.now[:alert] = 'Login unsuccessful'
      #flash.now[:alert] = @user.errors.full_messages.to_sentence

      render :new
    end
  end
  
  #for logout button on navbar
  def destroy
    @current_user = nil
    #User.find(session[:user_id]).destroy  
    session[:user_id] = nil
    #create proper redirect path
    flash.now[:alert] = 'Logout Successful'
    redirect_to new_session_path
  end
end
