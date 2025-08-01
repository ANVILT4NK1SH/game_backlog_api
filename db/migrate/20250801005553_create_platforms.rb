class CreatePlatforms < ActiveRecord::Migration[8.0]
  def change
    create_table :platforms do |t|
      t.string :name, null: false
      t.string :slug
      t.string :img_url
      t.integer :games_count

      t.timestamps
    end

    add_index :platforms, :name, unique: true
    add_index :platforms, :slug, unique: true
  end
end
