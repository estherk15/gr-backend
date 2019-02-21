class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio

  has_many :lists
  # has_many :books, through: :lists
  # has_many :responses
end
