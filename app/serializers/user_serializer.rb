class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :encrypted_password
  has_many :posts
end
