class Choice < ApplicationRecord
  belongs_to :content
  has_many :votes, dependent: :destroy
  has_one_attached :image

  validates :text_or_image, presence: true

  def text_or_image
    text.presence or image.presence
  end

  def vote_user(user_id)
    votes.find_by(user_id: user_id)
  end
end
