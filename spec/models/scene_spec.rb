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
require 'rails_helper'

RSpec.describe Scene, type: :model do
  it 'has_many roles' do
    scene = create(:scene)
    role = create(:role, show: scene.show)
    scene.roles << role
    expect(scene.roles).to match_array([role])
  end
end
