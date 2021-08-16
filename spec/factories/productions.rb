# == Schema Information
#
# Table name: productions
#
#  id          :bigint           not null, primary key
#  closing     :date
#  name        :string
#  opening     :date
#  rehearsal   :date
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :bigint           not null
#  show_id     :bigint           not null
#
# Indexes
#
#  index_productions_on_location_id  (location_id)
#  index_productions_on_show_id      (show_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_id => locations.id)
#  fk_rails_...  (show_id => shows.id)
#
FactoryBot.define do
  factory :production do
    show
    location
    sequence(:name) { |n| "Production_#{n}" }
    closing { "2021-08-01" }
    opening { "2021-08-01" }
    rehearsal { "2021-08-01" }
    type { "" }
  end
end
