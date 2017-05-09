class Topic < ApplicationRecord
  belongs_to :user
  has_many :messages
  after_commit { TopicRelayJob.perform_now(self) }
end
