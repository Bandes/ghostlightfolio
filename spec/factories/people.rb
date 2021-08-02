# == Schema Information
#
# Table name: people
#
#  id              :bigint           not null, primary key
#  age             :integer
#  email           :string
#  ethnicity       :string
#  first_name      :string
#  gender_identity :string
#  last_name       :string
#  lgbt            :boolean          default(FALSE)
#  notes           :string
#  phone           :string
#  strong_dancer   :boolean          default(FALSE)
#  strong_singer   :boolean          default(FALSE)
#  vocal_range     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_people_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :person do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    phone { "MyString" }
    user
  end
end
