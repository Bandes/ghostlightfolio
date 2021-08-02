class RemoveYearsFromAuthor < ActiveRecord::Migration[6.1]
  def change
    remove_column :authors, :birth_year, :date
    remove_column :authors, :death_year, :date
  end
end
