class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  belongs_to :user
  has_many :book_lists
  has_many :books, through: :book_lists
end
