class AddFieldsToShow < ActiveRecord::Migration[6.1]
  def change
    add_column :shows, :rights_holder, :string
    remove_column :shows, :copyright_year
    remove_column :shows, :year_written, :datetime
    add_column :shows, :year_written, :integer
  end
end
