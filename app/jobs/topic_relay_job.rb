class TopicRelayJob < ApplicationJob
  def perform(topic)
    ActionCable.server.broadcast "topics",
      id: topic.id,
      name: topic.name,
      user: topic.user.user_name,
      time: topic.created_at.strftime("%I:%M %p")
  end
end