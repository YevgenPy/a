class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :mail_if_comment, :created_at, :updated_at, :user_id
  belongs_to :user
  has_many :comments
end
