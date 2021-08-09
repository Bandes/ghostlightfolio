class RoleShowIdNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :roles, :show_id, false
  end
end
