class Content < ApplicationRecord
  belongs_to :user
  has_many :choices

  with_options presence: true do
    validates :title
    validates :user
  end
end
