class Content < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :user
  end
end
