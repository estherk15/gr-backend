class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :authors, :cover_url #, :genre

  # has_many :responses
  # has_many :book_lists
  has_many :lists #through: :book_lists
end
