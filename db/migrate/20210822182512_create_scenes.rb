class CreateScenes < ActiveRecord::Migration[6.1]
  def change
    create_table :scenes do |t|
      t.string :name
      t.string :description
      t.references :act, null: false, foreign_key: true
      t.string :page_numbers

      t.timestamps
    end
  end
end
