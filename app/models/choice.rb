class Choice < ApplicationRecord
  belongs_to :content
  has_many :votes

  validates :text, presence: true
end
