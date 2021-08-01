class AddLgbtToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :lgbt, :boolean
  end
end
