class CreateProductions < ActiveRecord::Migration[6.1]
  def change
    create_table :productions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.string :name
      t.date :closing
      t.date :opening
      t.date :rehearsal
      t.string :type

      t.timestamps
    end
  end
end
