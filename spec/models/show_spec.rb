# == Schema Information
#
# Table name: shows
#
#  id             :bigint           not null, primary key
#  copyright_year :date
#  description    :string
#  name           :string
#  public_domain  :boolean
#  show_code      :string
#  year_written   :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :bigint
#
# Indexes
#
#  index_shows_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#
require 'rails_helper'

RSpec.describe Show, type: :model do
  it 'validates uniqueness of name within user scope' do
    show1 = create(:show)
    show2 = build(:show, name: show1.name)

    expect(show2.valid?).to be false
    expect(show2.errors.full_messages).to include('Name has already been taken')
  end

  it 'validates name' do
    show = build(:show, name: nil)
    expect(show.valid?).to be false
    expect(show.errors.full_messages).to include("Name can't be blank")
  end
end
