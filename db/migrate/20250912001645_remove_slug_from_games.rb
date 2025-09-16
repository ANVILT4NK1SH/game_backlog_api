class RemoveSlugFromGames < ActiveRecord::Migration[8.0]
  def change
    remove_column :games, :slug, :string
  end
end
