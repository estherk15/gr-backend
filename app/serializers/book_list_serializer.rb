class BookListSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :book
  belongs_to :list
end
