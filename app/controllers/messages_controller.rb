class MessagesController < ApplicationController
	def create
		@message = Message.new(message_params)
		if @message.save
			ActionCable.server.broadcast 'messages',
	        message: @message.content,
	        user: @message.user.user_name,
	        topic_id: @message.topic_id
	        head :ok
		end
	end
	def message_params
		params.require(:message).permit(:content, :topic_id, :user_id)
	end
end
