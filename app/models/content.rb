class Content < ApplicationRecord
  belongs_to :user
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true

  with_options presence: true do
    validates :title
    validates :user
  end
end
