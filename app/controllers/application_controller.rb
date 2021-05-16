class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :sanitize_parameters, if: :devise_controller?
  protect_from_forgery unless: -> { request.format.json? }

  protected

  def sanitize_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end

end
