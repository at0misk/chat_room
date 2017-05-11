class TopicsController < ApplicationController
	def create
		@topic = Topic.new(topic_params)
		if @topic.save
			# broadcast_topic
			redirect_to "/topics/#{@topic.id}"
		end
	end
	def view
		@user = User.find(session[:user_id])
		@topic = Topic.find(params[:id])
	end
	def topic_params
		params.require(:topic).permit(:name, :user_id)
	end
	def destroy
		Topic.destroy(params['topic_id'])
		redirect_to '/chatroom_admin'
	end
	# def broadcast_topic
	# end
end
