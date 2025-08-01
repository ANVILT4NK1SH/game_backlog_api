class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :slug
      t.string :release_date, null: false
      t.string :img_url

      t.timestamps
    end

    add_index :games, :slug, unique: true
  end
end
