class ListSerializer < ActiveModel::Serializer
  attributes :id, :title #:book_list

  belongs_to :user
  has_many :books

  # def book_list
  #   List.find(object.book_ids)
  # end
end
