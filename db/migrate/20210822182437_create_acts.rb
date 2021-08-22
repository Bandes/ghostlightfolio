class CreateActs < ActiveRecord::Migration[6.1]
  def change
    create_table :acts do |t|
      t.string :name
      t.string :description
      t.references :show, null: false, foreign_key: true
      t.string :page_numbers

      t.timestamps
    end
  end
end
