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
require 'rails_helper'

RSpec.describe Act, type: :model do
  it 'has_many roles' do
    act = create(:act)
    role = create(:role, show: act.show)
    act.roles << role
    expect(act.roles).to match_array([role])
  end
end
