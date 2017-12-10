class ApplicationController < ActionController::API
	before_action :authenticate_request
	attr_reader :current_user

	private

	def authenticate_request
		@current_user = nil
		auth_command = AuthorizeRequest.call(request.headers)
		if auth_command.success?
			@current_user = auth_command.result
		else
			render json: { error: auth_command.errors }, status: 401
		end
	end
end
