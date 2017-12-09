class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate

  # Authenticate the user with token based authentication
  def authenticate
    authenticate_token || render_unauthorized("Access denied")
  end

  def current_user
    @current_user ||= authenticate_token
  end

  protected
	def authenticate_token
	  authenticate_with_http_token do |token, options|
	    # Compare the tokens in a time-constant manner, to mitigate timing attacks.
	    if user = User.find_by(api_key: token)
	      ActiveSupport::SecurityUtils.secure_compare(
	                      ::Digest::SHA256.hexdigest(token),
	                      ::Digest::SHA256.hexdigest(user.api_key))
	      user
	    end
	  end
	end 

  def render_unauthorized(message)
    errors = { errors: [ { detail: message } ] }
    render json: errors, status: :unauthorized
  end

end
