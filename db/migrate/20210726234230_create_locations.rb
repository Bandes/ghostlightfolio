class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.integer :capacity

      t.timestamps
    end
  end
end
