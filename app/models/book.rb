class Book < ApplicationRecord
  has_many :responses, dependent: :destroy
  # has_many :book_lists
  belongs_to :list
   #, through: :book_lists
   #
   # def newlist
   #   self.list
   # end

   def book_list
     self.list.title
   end

   def snippet
     description = self.description.slice(0, 500)+ "..."
     # if description.length > 500
     #   return description + "..."
     # else
     #   description
     # end
   end

end
