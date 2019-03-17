class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.belongs_to :book, index: true
      t.belongs_to :user, index: true
      t.string :title
      t.string :content
    
      t.timestamps
    end
  end
end
