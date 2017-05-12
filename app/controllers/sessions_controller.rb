class SessionsController < ApplicationController
	def landing
		@categories = Category.all
	end
	def chatroom
		@user = User.find(session[:user_id])
		@topics = Topic.all
	end
	def chatroom_admin
		@user = User.find(session[:user_id])
		@topics = Topic.all
		if !@user.permod
			redirect_to '/'
		end
	end
	def create
		@user = User.find_by(user_name: params['user_name'])
		if @user
			session[:user_id] = @user.id
			redirect_to '/'
		else
			flash[:error] = 'User not found'
			redirect_to :back
		end
	end
	def logout
		session[:user_id] = nil
		redirect_to '/'
	end
	def about
	end
	def contact
	end
end
