require 'rails_helper'

RSpec.describe ShowXlsxGenerator do

  it 'returns expected values from methods' do
    show = create(:show)
    act1 = create(:act, show: show)
    scene = create(:scene, act: act1)
    french_scene = create(:french_scene, scene: scene)
    act2 = create(:act, show: show)
    role = create(:role, show: show)

    act1.roles << role

    subject = described_class.new(show: show)
    expect(subject.act_columns).to eq(['Roles', act1.name, scene.name, french_scene.name, act2.name])
    expect(subject.role_act_chart_data).to eq([[role.name, 'X', nil, nil, nil]])
  end

end
