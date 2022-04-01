class Post < ApplicationRecord
  paginates_per 5

  has_many :comments, dependent: :destroy

  belongs_to :user

  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true, length: {minimum: 3}
end
