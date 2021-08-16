class MakeEthnicityArray < ActiveRecord::Migration[6.1]
  def change
    change_column :authors, :ethnicity, :string, array: true, default: [], using: "(string_to_array(ethnicity, ','))"
    change_column :roles, :ethnicity, :string, array: true, default: [], using: "(string_to_array(ethnicity, ','))"
    change_column :people, :ethnicity, :string, array: true, default: [], using: "(string_to_array(ethnicity, ','))"
  end
end
