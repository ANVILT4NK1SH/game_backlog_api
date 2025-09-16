class AddRawgIdToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :rawg_id, :integer, null: false
    add_index :games, :rawg_id, unique: true
  end
end
