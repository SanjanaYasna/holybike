class SessionsController < ApplicationController
    #skip_before_action :authorize, only: :create
    def new
        @user = User.new
    end
    def create  
        @user = User.find_by(email: params[:email])
        #authenticate method in user.rb
        if @user&.authenticate(params[:password])
            session[:user_id] = @user.id
            render json: user
            logger.debug "User: #{user}"
            #print session user id
            logger.debug "Session User ID: #{@user.id}"
        else
            render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
end
