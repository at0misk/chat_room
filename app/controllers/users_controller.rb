class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/chatroom'
		end
	end
	def user_params
		params.require(:user).permit(:user_name, :password)
	end
end
