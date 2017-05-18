class CategoriesController < ApplicationController
	def all
		@user = User.find(session[:user_id])
		@categories = Category.all
			if !@user.permod
				redirect_to '/'
			end
	end
	def new
	end
	def create
		@category = Category.new(category_params)
		if @category.save
		else
			flash[:errors] = "Something went wrong - Did not save."
		end
			redirect_to '/categories'
	end
	def category_params
		params.require(:category).permit(:name)
	end
	def view
		@category = Category.find(params['id'])
		@videos = Video.where(category_id: @category.id)
		if @videos
			@video = @videos[0]
			@rand = rand(0..@videos.length-1)
			@rand_video = @videos[@rand]
		end
	end
	def destroy
		@category = Category.find(params['id'])
		@category.destroy
		redirect_to :back
	end
end
