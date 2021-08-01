class AddColumnsToRoles < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :gender_identity, :string
    add_column :roles, :age_min, :integer
    add_column :roles, :age_max, :integer
    add_column :roles, :strong_dancer, :boolean, default: false
    add_column :roles, :strong_singer, :boolean, default: false
    add_column :roles, :ethnicity, :string
    add_column :roles, :lgbt, :boolean, default: false

    remove_reference :roles, :production, foreign_key: true
    add_reference :roles, :show, foreign_key: true
  end
end
