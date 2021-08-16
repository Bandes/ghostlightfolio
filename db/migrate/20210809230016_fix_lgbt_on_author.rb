class FixLgbtOnAuthor < ActiveRecord::Migration[6.1]
  def change
    change_column_default :authors, :lgbt, false
  end
end
