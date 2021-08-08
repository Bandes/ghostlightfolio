# == Schema Information
#
# Table name: roles
#
#  id              :bigint           not null, primary key
#  age_max         :integer
#  age_min         :integer
#  description     :string
#  ethnicity       :string
#  gender_identity :string
#  lgbt            :boolean          default(FALSE)
#  name            :string
#  strong_dancer   :boolean          default(FALSE)
#  strong_singer   :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  show_id         :bigint
#
# Indexes
#
#  index_roles_on_show_id  (show_id)
#
# Foreign Keys
#
#  fk_rails_...  (show_id => shows.id)
#
require 'rails_helper'

RSpec.describe Role, type: :model do
  it 'validates uniqueness of name within show scope' do
    role1 = create(:role)
    role2 = build(:role, name: role1.name, show: role1.show)

    expect(role2.valid?).to be false
    expect(role2.errors.full_messages).to include('Name has already been taken')
  end

  it 'validates name' do
    role = build(:role, name: nil)
    expect(role.valid?).to be false
    expect(role.errors.full_messages).to include("Name can't be blank")
  end
end
