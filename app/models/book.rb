class Book < ApplicationRecord
  has_many :responses

  has_many :book_lists
  has_many :lists, through: :book_lists
end
