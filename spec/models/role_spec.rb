# == Schema Information
#
# Table name: roles
#
#  id            :bigint           not null, primary key
#  description   :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  person_id     :bigint           not null
#  production_id :bigint           not null
#
# Indexes
#
#  index_roles_on_person_id      (person_id)
#  index_roles_on_production_id  (production_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_id => people.id)
#  fk_rails_...  (production_id => productions.id)
#
require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'validates uniqueness of name within production scope' do
    role1 = create(:role)
    role2 = build(:role, name: role1.name, production: role1.production)

    expect(role2.valid?).to be false
    expect(role2.errors.full_messages).to include('Name has already been taken')
  end

  it 'validates name' do
    role = build(:role, name: nil)
    expect(role.valid?).to be false
    expect(role.errors.full_messages).to include("Name can't be blank")
  end
end
