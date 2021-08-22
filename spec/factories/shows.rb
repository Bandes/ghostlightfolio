# == Schema Information
#
# Table name: shows
#
#  id            :bigint           not null, primary key
#  description   :string
#  genre         :string
#  name          :string
#  public_domain :boolean
#  rights_holder :string
#  show_code     :string
#  show_type     :string
#  year_written  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :show do
    sequence(:name) { |n| "show-#{n}"}
    genre { 'comedy' }
    show_type { 'musical' }
    sequence(:show_code) { |n| "s-code-#{n}" }
    year_written { 2020 }
    description { 'A good musical' }
    rights_holder { 'nobody' }
  end
end
