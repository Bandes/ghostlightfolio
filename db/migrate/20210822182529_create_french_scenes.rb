class CreateFrenchScenes < ActiveRecord::Migration[6.1]
  def change
    create_table :french_scenes do |t|
      t.string :name
      t.string :description
      t.references :scene, null: false, foreign_key: true
      t.string :page_numbers

      t.timestamps
    end
  end
end
