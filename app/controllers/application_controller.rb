class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?  
  before_action :ensure_json_request  

  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  protected
  def configure_permitted_parameters
    #params.require(:user).permit(:user, :name, :nickname, :email, :password, :password_confirmation, :group_id, :uid, :username, :surname, :telephone, :role)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :role, :name, :surname, :telephone, :provider, :uid,:group_id, :confirm_success_url, :registration, ])
  end



  def ensure_json_request  
    return if request.format == :json
    render :nothing => true, :status => 406  
  end  
end



