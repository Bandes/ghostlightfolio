class AddDefaultForEditor < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :editor, false
  end
end
