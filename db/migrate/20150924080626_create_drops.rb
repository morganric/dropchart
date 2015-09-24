class CreateDrops < ActiveRecord::Migration
  def change
    create_table :drops do |t|
      t.string :audio
      t.string :clip
      t.string :cover
      t.date :release_date
      t.string :url
      t.integer :user_id
      t.string :slug
      t.string :tag_list
      t.string :artist
      t.string :track
      t.string :label
      t.string :album
      t.text :credits

      t.timestamps null: false
    end
  end
end
