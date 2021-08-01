# == Schema Information
#
# Table name: shows
#
#  id         :bigint           not null, primary key
#  author     :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_shows_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Show, type: :model do
  it 'validates uniqueness of name within user scope' do
    show1 = create(:show)
    show2 = build(:show, name: show1.name, user: show1.user)

    expect(show2.valid?).to be false
    expect(show2.errors.full_messages).to include('Name has already been taken')
  end

  it 'validates name' do
    show = build(:show, name: nil)
    expect(show.valid?).to be false
    expect(show.errors.full_messages).to include("Name can't be blank")
  end
end
