class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender_identity
      t.date :birth_year
      t.date :death_year
      t.string :ethnicity

      t.timestamps
    end

    add_reference :shows, :author, foreign_key: true
  end
end
