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
	def destroy
		@blog = Blog.find(params['id'])
		@blog.destroy
		redirect_to :back
	end
	def edit
		@blog = Blog.find(params['id'])
		@user = User.find(session[:user_id])
	end
   	def update
  		@blog = Blog.find(params['id'])
	    if @blog.update(blog_params)
	    	flash[:errors] = nil
	    else
	    	flash[:errors] = @blog.errors.full_messages
	    end
	    redirect_to :back
  	end
end
