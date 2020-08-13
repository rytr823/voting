class Choice < ApplicationRecord
  belongs_to :content
  has_many :votes, dependent: :destroy

  validates :text, presence: true

  def vote_user(user_id)
    votes.find_by(user_id: user_id)
  end
end
