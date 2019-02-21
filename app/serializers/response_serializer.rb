class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :title, :content

  belongs_to :user
  belongs_to :book
end
