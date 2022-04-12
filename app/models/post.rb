class Post < ApplicationRecord
  searchkick

  paginates_per 5

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: {minimum: 3}
  validates :body, presence: true, length: {minimum: 3}

  scope :search_import, -> { includes(:user, :comments) }

  def search_data
    super().merge!(author: user.username, comments: comments.map(&:value).join(' '))
  end
end

