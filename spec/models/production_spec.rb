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
#  user_id     :bigint           not null
#
# Indexes
#
#  index_productions_on_location_id  (location_id)
#  index_productions_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_id => locations.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Production, type: :model do

  it 'validates uniqueness of name within user scope' do
    production1 = create(:production)
    production2 = build(:production, name: production1.name, user: production1.user)

    expect(production2.valid?).to be false
    expect(production2.errors.full_messages).to include('Name has already been taken')
  end

  it 'validates name' do
    production = build(:production, name: nil)
    expect(production.valid?).to be false
    expect(production.errors.full_messages).to include("Name can't be blank")
  end
end
