class VideosController < ApplicationController
	def index
		@categories = Category.all
	end
	def categories_view
		@category = Category.find(params['id'])
		@videos = Video.where(category_id: params['id'])
	end
	def create
		v = Video.new
		v.vfile = params[:file]
		v.name = params[:name]
		v.category_id = params[:category]
		v.description = params[:description]
		if v.save!
			puts "=========================================================="
			puts params[:file]
			puts v.vfile
			puts v.vfile.file.nil?
		else
			fail
		end
			redirect_to :back
	end
	def new
		@categories = Category.all
	end
end
