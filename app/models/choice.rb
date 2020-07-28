class Choice < ApplicationRecord
  belongs_to :content

  validates :text, presence: true
end
