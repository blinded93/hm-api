class UsersController < ApplicationController
	def index
		render json: User.all
	end

	def show
		user = User.find_by_id(params[:id])
		render json: user
	end

	def create
		user = User.new(user_params)

		user.save if user.valid?
		status = user.errors.any? ? 400 : 200

		render json: user, status: status
	end

	private
		def user_params
			params.permit(:username, :email, :password)
		end
end
