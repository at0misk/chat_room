class SpecialsController < ApplicationController
	def index
		@specials = Special.all
	end
	def new
		@specials = Special.all
		@categories = Category.all
	end
	def create
		@special = Special.new(special_params)
		if @special.save
		else
			flash[:errors] = "Something went wrong"
		end
			redirect_to :back
	end
	def special_params
		params.require(:special).permit(:title, :description, :category_id)
	end
	def edit
		@special = Special.find(params['id'])
		@categories = Category.all
	end
   	def update
  		@special = Special.find(params['id'])
	    if @special.update(special_params)
	    	flash[:errors] = nil
	    else
	    	flash[:errors] = @special.errors.full_messages
	    end
	    redirect_to '/specials/new'
  	end
  	def destroy
 		@special = Special.find(params['id'])
		@special.destroy
		redirect_to :back
  	end
  	def by_category
  		@specials = Special.where(category_id: params['id'])
  	end
  	def view
  		@special = Special.find(params['id'])
  	end
end