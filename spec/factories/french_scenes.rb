# == Schema Information
#
# Table name: french_scenes
#
#  id           :bigint           not null, primary key
#  description  :string
#  name         :string
#  page_numbers :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  scene_id     :bigint           not null
#
# Indexes
#
#  index_french_scenes_on_scene_id  (scene_id)
#
# Foreign Keys
#
#  fk_rails_...  (scene_id => scenes.id)
#
FactoryBot.define do
  factory :french_scene do
    sequence(:name) { |n| "French Scene #{n}" }
    description { "Description" }
    scene
    page_numbers { "1-5" }
  end
end
