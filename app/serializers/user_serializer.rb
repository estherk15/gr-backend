class UserSerializer < ActiveModel::Serializer
  attributes :id, :username #, :uniq_books

  has_many :lists
  has_many :books, through: :lists
  has_many :responses


  # def uniq_books
  #   return :book.uniq
  # end
end
