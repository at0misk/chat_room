class TopicRelayJob < ApplicationJob
  def perform(topic)
    ActionCable.server.broadcast "topics",
      id: topic.id,
      name: topic.name
  end
end