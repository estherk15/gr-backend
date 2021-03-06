class User < ApplicationRecord
  # has_secure_password
  has_many :lists, dependent: :destroy
   #If you delete the User, delete it's dependent Lists as well.
  has_many :books, through: :lists
  has_many :responses

  def book_list
    self.books
  end
end
