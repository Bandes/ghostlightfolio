class AddTypeToShow < ActiveRecord::Migration[6.1]
  def change
    add_column :shows, :show_type, :string
    add_column :shows, :genre, :string
  end
end
