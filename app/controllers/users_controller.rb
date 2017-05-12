class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			@user.update_attribute(:permod, false)
			redirect_to '/chatroom'
		end
	end
	def user_params
		params.require(:user).permit(:user_name, :password)
	end
end
