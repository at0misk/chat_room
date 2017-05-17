class VideosController < ApplicationController
	def index
		@categories = Category.all
	end
	def categories_view
		@category = Category.find(params['id'])
		@videos = Video.where(category_id: params['id'])
	end
	def create
		if !params[:file] || !params[:name] || !params[:category] || !params[:description]
			flash[:errors] = "Fill out all fields"
		else
			v = Video.new
			v.vfile = params[:file]
			v.name = params[:name]
			v.category_id = params[:category]
			v.description = params[:description]
			if v.save!

			else
				flash[:errors] = "Record saved, but file wasn't uploaded."
			end
		end
			redirect_to :back
	end
	def new
		@categories = Category.all
	end
end
