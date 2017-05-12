class UsersController < ApplicationController
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			@user.update_attribute(:permod, false)
			redirect_to '/chatroom'
		end
	end
	def edit
		@user = User.find(session[:user_id])
	end
	def user_params
		params.require(:user).permit(:user_name, :password)
	end
   	def update
  		@user = User.find(session[:user_id])
	    if @user.update(user_params)
	    	flash[:errors] = nil
	    else
	    	flash[:errors] = @user.errors.full_messages
	    end
	    redirect_to :back
  	end
end
