module Api
  module V2
    class Api::V2::SessionsController < ApplicationController
      skip_before_action :authenticate, only: [:create], raise: false

      def create
        if user = User.valid_login?(params[:email], params[:password])
          allow_api_key_only_once user # quero gerar key diferente
                                       # a cada novo login? :-)
          send_api_key user
        else
          render_unauthorized("Error with your login or password")
        end
      end

      def destroy
        logout
        head :ok
      end

      private

      def send_api_key(user)
        render json: { token: user.api_key }
      end

      def allow_api_key_only_once(user)
        user.regenerate_api_key
      end

      def logout
        current_user.invalidate_api_key
      end
    end
  end
end
