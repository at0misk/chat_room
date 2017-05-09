class TopicsController < ApplicationController
	def create
		@topic = Topic.new(topic_params)
		if @topic.save
			redirect_to "/topics/#{@topic.id}"
		end
	end
	def view
		@topic = Topic.find(params[:id])
	end
	def topic_params
		params.require(:topic).permit(:name, :user_id)
	end
	def destroy
		Topic.destroy(params['topic_id'])
		redirect_to '/chatroom'
	end
end
