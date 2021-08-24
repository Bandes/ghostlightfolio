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
require 'rails_helper'

RSpec.describe FrenchScene, type: :model do
  it 'has_many roles' do
    french_scene = create(:french_scene)
    role = create(:role, show: french_scene.show)
    french_scene.roles << role
    expect(french_scene.roles).to match_array([role])
  end
end
