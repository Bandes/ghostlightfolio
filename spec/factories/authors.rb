# == Schema Information
#
# Table name: authors
#
#  id              :bigint           not null, primary key
#  author_code     :string
#  ethnicity       :string
#  first_name      :string
#  gender_identity :string
#  last_name       :string
#  lgbt            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :author do
    sequence(:first_name) { |n| "first_name_#{n}"}
    sequence(:last_name) { |n| "last_name_#{n}"}
    gender_identity { Constants::GENDER_IDENTITIES.values.sample }
    ethnicity { Constants::ETHNICITIES.values.sample }
  end
end
