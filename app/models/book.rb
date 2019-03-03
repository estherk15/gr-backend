class Book < ApplicationRecord
  has_many :responses, dependent: :destroy
  # has_many :book_lists
  belongs_to :list
   #, through: :book_lists

end
