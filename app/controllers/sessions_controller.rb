class SessionsController < Devise::SessionsController
    def create
      user = User.find_by_email(sign_in_params[:email])
    
      if user && user.valid_password?(sign_in_params[:password])
        @current_user = user
      else
        render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
      end
    end

    private
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

end
  