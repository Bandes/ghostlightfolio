# == Schema Information
#
# Table name: people
#
#  id              :bigint           not null, primary key
#  age             :integer
#  email           :string
#  ethnicity       :string           default([]), is an Array
#  first_name      :string
#  gender_identity :string
#  last_name       :string
#  lgbt            :boolean          default(FALSE)
#  notes           :string
#  phone           :string
#  strong_dancer   :boolean          default(FALSE)
#  strong_singer   :boolean          default(FALSE)
#  vocal_range     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_people_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'validates presence of first_name' do
    person = build(:person, first_name: nil)
    expect(person.valid?).to be false
    expect(person.errors.full_messages).to include "First name can't be blank"
  end

  it 'validates presence of last_name' do
    person = build(:person, last_name: nil)
    expect(person.valid?).to be false
    expect(person.errors.full_messages).to include "Last name can't be blank"
  end
end
