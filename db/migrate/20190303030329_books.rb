class Books < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :google_id
      t.string :title
      t.string :authors, array: true, default: []
      t.string :cover_url
      t.text :description
      t.references :list, foreign_key: true
      #hopefully this will allow for the authors to be an array?
      # t.string :authors
      # t.string :genre

      t.timestamps
    end
  end
end
