class AddShowToProduction < ActiveRecord::Migration[6.1]
  def change
    add_reference :productions, :show, null: false, foreign_key: true
    remove_reference :productions, :user
  end
end
