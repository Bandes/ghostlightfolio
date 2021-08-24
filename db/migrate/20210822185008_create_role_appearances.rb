class CreateRoleAppearances < ActiveRecord::Migration[6.1]
  def change
    create_table :role_appearances do |t|
      t.references :roleable, null: false, polymorphic: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
