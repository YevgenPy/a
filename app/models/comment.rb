class Comment < ApplicationRecord
  paginates_per 5
  belongs_to :post
  belongs_to :user

  validates :body, presence: true, length: {minimum: 5}

end
