class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :cover_url

  has_many :responses
  # has_many :book_lists
  has_many :lists #through: :book_lists
end
