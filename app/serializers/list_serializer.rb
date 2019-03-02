class ListSerializer < ActiveModel::Serializer
  attributes :id, :title #:beef

  belongs_to :user
  has_many :books
  #
  #
  # def beef
  #   return "whatever"
  # end

  # # # has_many :book_lists
  # has_many :books #through: :book_lists


end
