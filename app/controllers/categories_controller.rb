class CategoriesController < ApplicationController
	def all
		@categories = Category.all
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
	end
	def destroy
		@category = Category.find(params['id'])
		@category.destroy
		redirect_to :back
	end
end
