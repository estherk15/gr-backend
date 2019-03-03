class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :authors, :cover_url #, :genre
  belongs_to :list

end
