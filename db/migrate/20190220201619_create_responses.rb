class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :title
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
