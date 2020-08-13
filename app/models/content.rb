class Content < ApplicationRecord
  belongs_to :user
  has_many :choices, dependent: :destroy
  has_many :votes, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true

  validates_associated :choices

  with_options presence: true do
    validates :title
    validates :user
  end
end
