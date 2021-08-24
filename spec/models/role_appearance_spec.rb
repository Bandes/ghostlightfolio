# == Schema Information
#
# Table name: role_appearances
#
#  id            :bigint           not null, primary key
#  roleable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  role_id       :bigint           not null
#  roleable_id   :bigint           not null
#
# Indexes
#
#  index_role_appearances_on_role_id   (role_id)
#  index_role_appearances_on_roleable  (roleable_type,roleable_id)
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#
require 'rails_helper'

RSpec.describe RoleAppearance, type: :model do
  it 'can assign act as roleable' do
    act = create(:act)
    role = create(:role, show: act.show)
    subject = described_class.new(role: role, roleable: act)
    expect(subject.valid?).to be true
  end

  it 'can assign scene as roleable' do
    scene = create(:scene)
    role = create(:role, show: scene.show)
    subject = described_class.new(role: role, roleable: scene)
    expect(subject.valid?).to be true
  end

  it 'can assign french_scene as roleable' do
    french_scene = create(:french_scene)
    role = create(:role, show: french_scene.show)
    subject = described_class.new(role: role, roleable: french_scene)
    expect(subject.valid?).to be true
  end
end
