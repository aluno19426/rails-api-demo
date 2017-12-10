module Api
  module V2
    class AuthenticationsController < ApplicationController

      skip_before_action :authenticate_request
      
      def create
        token_command = AuthenticateUser.call(params[:email], params[:password])

        if token_command.success?
          render json: { token: token_command.result }
        else
          render json: { error: token_command.errors }, status: :unauthorized
        end
      end

    end
  end
end
