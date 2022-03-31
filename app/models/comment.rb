class Comment < ApplicationRecord
  paginates_per 5
  belongs_to :post, dependent: :destroy
  belongs_to :user

  validates :body, presence: true, length: {minimum: 5}
end