class AuthenticationController < ApplicationController
	before_action :authenticate_request!, only: [:verify_user]
	def verify_user
		render json: payload(current_user)
	end

	def authenticate_user
		identifier = Identifier.parse(params[:identifier])
		user = User.find_by(identifier)

		if !!user && user.authenticate(params[:password])
			render json: payload(user)
		else
			render json: { errors: ['Invalid Username/Password'] }, status: :unauthorized
		end
	end

	private
		def payload(user)
			return nil unless user and user.id

			{
				auth_token: JsonWebToken.encode({ user_id: user.id }),
				user: { id: user.id, username: user.username, email: user.email }
			}
		end
end