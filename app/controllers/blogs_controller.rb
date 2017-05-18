class BlogsController < ApplicationController
	def view
		@blogs = Blog.all
		@user = User.find(session[:user_id])
	end
	def new
		@user = User.find(session[:user_id])
	end
	def create
		@blog = Blog.new(blog_params)
		if @blog.save
		else
			flash[:errors] = "Blog did not save"
		end
		redirect_to '/blog'
	end
	def blog_params
		params.require(:blog).permit(:title, :content, :user_id)
	end
end
