class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_reputation :votes, source: :user, aggregated_by: :sum
end
