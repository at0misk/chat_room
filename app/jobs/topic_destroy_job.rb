class TopicDestroyJob < ApplicationJob
  def perform(topic)
	ActionCable.server.broadcast 'messages',
    message: "Your conversation has ended.  Click <a href='/chatroom'>here</a> to go back.",
    user: "System",
    topic_id: topic.id
  end
end