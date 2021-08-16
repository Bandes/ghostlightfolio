class AddColumnsToShows < ActiveRecord::Migration[6.1]
  def change
    remove_column :shows, :author
    add_column :shows, :copyright_year, :date
    add_column :shows, :year_written, :date
    add_column :shows, :public_domain, :boolean
    add_column :shows, :description, :string
  end
end
