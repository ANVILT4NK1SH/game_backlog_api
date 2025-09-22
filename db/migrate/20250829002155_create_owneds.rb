class CreateOwneds < ActiveRecord::Migration[8.0]
  def change
    create_table :owneds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ownable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
