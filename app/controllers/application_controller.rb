class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_filter :configure_devise_params, if: devise_controller?

  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email,:password, :group_id)
    end
  end
end
