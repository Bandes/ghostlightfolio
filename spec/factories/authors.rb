# == Schema Information
#
# Table name: authors
#
#  id              :bigint           not null, primary key
#  birth_year      :date
#  death_year      :date
#  ethnicity       :string
#  first_name      :string
#  gender_identity :string
#  last_name       :string
#  lgbt            :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :author do
    sequence(:first_name) { |n| "first_name_#{n}"}
    sequence(:last_name) { |n| "last_name_#{n}"}
    gender_identity { "MyString" }
    birth_year { "2021-08-01" }
    death_year { "2021-08-01" }
    ethnicity { "Unknown" }
  end
end
