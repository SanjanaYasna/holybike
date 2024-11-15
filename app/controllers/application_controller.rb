class ApplicationController < ActionController::API
    include ActionController::Cookies
    include ActionController::Flash
  
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  
    before_action :authorize
  
    private
  
    #check if the user is logged in by checking session id
    def authorize
      @current_user = User.find_by(id: session[:user_id])
      render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
    end
  
    #render error message if user is not an admin
    def authorize_admin
      render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user&.admin?
    end

    def render_unprocessable_entity_response(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
    
    #render public/404.html
    def render_404
      render file: "#{Rails.root}/public/404.html", status: 404
    end
end