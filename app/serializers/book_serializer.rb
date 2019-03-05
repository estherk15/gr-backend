class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :authors, :cover_url, :book_list, :description, :snippet  #:book_list
  # belongs_to :list

end
