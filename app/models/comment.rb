class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, inverse_of: :comments

  validates :comment, presence: true, length: { maximum: 10_000 }
  validates :name, length: { maximum: 255 }, allow_blank: true
end
