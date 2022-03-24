class Comment < ApplicationRecord
  paginates_per 5
  belongs_to :post, dependent: :destroy
  belongs_to :user

  validates :body, presence: true, length: {minimum: 5}

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
