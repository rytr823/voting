class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :choice

  validates :choice, presence: true
end
