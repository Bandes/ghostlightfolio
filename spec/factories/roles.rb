# == Schema Information
#
# Table name: roles
#
#  id              :bigint           not null, primary key
#  age_max         :integer
#  age_min         :integer
#  description     :string
#  ethnicity       :string
#  gender_identity :string
#  lgbt            :boolean          default(FALSE)
#  name            :string
#  strong_dancer   :boolean          default(FALSE)
#  strong_singer   :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  show_id         :bigint
#
# Indexes
#
#  index_roles_on_show_id  (show_id)
#
# Foreign Keys
#
#  fk_rails_...  (show_id => shows.id)
#
FactoryBot.define do
  factory :role do
    show
    person
    sequence(:name) { |n| "Role-#{n}" }
    description { "MyString" }
  end
end
