class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :lists 
  has_many :books
  # has_many :books #, through: :lists
  # has_many :responses

  # def book_list
  #
  # end
end
