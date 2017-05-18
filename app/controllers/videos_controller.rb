class VideosController < ApplicationController
	def index
		@categories = Category.all
	end
	def categories_view
		@category = Category.find(params['id'])
		@videos = Video.where(category_id: params['id'])
		if session[:index]
			@path = @videos[session[:index]].vfile.url
			session[:index] = nil
			session[:cat_id] = nil
		else
			@path = @videos[0].vfile.url
		end
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
		@videos = Video.all
		@categories = Category.all
	end
	def destroy
		@video = Video.find(params['id'])
		@video.destroy
		redirect_to :back
	end
	def admin_view
		fail
		session[:index] = params['x']
		session[:cat_id] = params['id']
		redirect_to "/videos/#{session[:cat_id]}"
	end
end
