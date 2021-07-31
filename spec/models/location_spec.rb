# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  address    :string
#  capacity   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_locations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'validates name' do
    location = build(:location, name: nil)
    expect(location.valid?).to be false
    expect(location.errors.full_messages).to include("Name can't be blank")
  end
end
