class CreateCredits < ActiveRecord::Migration[6.1]
  def change
    create_table :credits do |t|
      t.references :author, null: false, foreign_key: true
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end

    remove_reference :shows, :author
  end
end
