class AddColumnsToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :gender_identity, :string
    add_column :people, :age, :integer
    add_column :people, :strong_dancer, :boolean, default: false
    add_column :people, :strong_singer, :boolean, default: false
    add_column :people, :vocal_range, :string
    add_column :people, :lgbt, :boolean, default: false
    add_column :people, :ethnicity, :string
    add_column :people, :notes, :string
  end
end
