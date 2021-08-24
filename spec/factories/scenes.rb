# == Schema Information
#
# Table name: scenes
#
#  id           :bigint           not null, primary key
#  description  :string
#  name         :string
#  page_numbers :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  act_id       :bigint           not null
#
# Indexes
#
#  index_scenes_on_act_id  (act_id)
#
# Foreign Keys
#
#  fk_rails_...  (act_id => acts.id)
#
FactoryBot.define do
  factory :scene do
    sequence(:name) { |n| "Scene #{n}" }
    description { "Description" }
    act
    page_numbers { "1-5" }
  end
end
