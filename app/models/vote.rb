class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :choice, counter_cache: :votes_count

  validates :choice, presence: true
end
