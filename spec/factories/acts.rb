# == Schema Information
#
# Table name: acts
#
#  id           :bigint           not null, primary key
#  description  :string
#  name         :string
#  page_numbers :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  show_id      :bigint           not null
#
# Indexes
#
#  index_acts_on_show_id  (show_id)
#
# Foreign Keys
#
#  fk_rails_...  (show_id => shows.id)
#
FactoryBot.define do
  factory :act do
    sequence(:name) { |n| "Act #{n}" }
    description { "Description" }
    show
    page_numbers { "1-5" }
  end
end
