class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
