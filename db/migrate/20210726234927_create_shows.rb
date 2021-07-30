class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :author

      t.timestamps
    end
  end
end
