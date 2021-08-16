class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.references :production, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
