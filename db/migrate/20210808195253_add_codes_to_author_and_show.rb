class AddCodesToAuthorAndShow < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :author_code, :string
    add_column :shows, :show_code, :string

    remove_column :roles, :person_id
  end
end
