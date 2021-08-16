class RemoveUserFromShows < ActiveRecord::Migration[6.1]
  def change
    remove_reference :shows, :user, foreign_key: true
  end
end
