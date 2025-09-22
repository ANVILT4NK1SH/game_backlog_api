class CreateBacklogs < ActiveRecord::Migration[8.0]
  def change
    create_table :backlogs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :backloggable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
