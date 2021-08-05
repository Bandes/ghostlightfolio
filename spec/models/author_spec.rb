# == Schema Information
#
# Table name: authors
#
#  id              :bigint           not null, primary key
#  ethnicity       :string
#  first_name      :string
#  gender_identity :string
#  last_name       :string
#  lgbt            :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'validates presence of first_name' do
    author = build(:author, first_name: nil)
    expect(author.valid?).to be false
    expect(author.errors.full_messages).to include "First name can't be blank"
  end

  it 'validates presence of last_name' do
    author = build(:author, last_name: nil)
    expect(author.valid?).to be false
    expect(author.errors.full_messages).to include "Last name can't be blank"
  end

  it 'validates uniqueness of first_name and last_name together' do
    author = create(:author, first_name: 'George', last_name: 'Washington')
    not_unique_author = build(:author, first_name: 'George', last_name: 'Washington')
    not_unique_author.valid?
    expect(not_unique_author.errors.full_messages).to match_array(['First name has already been taken', 'Last name has already been taken'])
  end

  it 'Is unique if first_name is different' do
    author = create(:author, first_name: 'George', last_name: 'Washington')
    also_unique_author = build(:author, first_name: 'Martha', last_name: 'Washington')
    expect(also_unique_author.valid?).to be true
  end

  it 'is unique if last name is different' do
    author = create(:author, first_name: 'George', last_name: 'Washington')
    also_unique_author = build(:author, first_name: 'George', last_name: 'Jetson')
    expect(also_unique_author.valid?).to be true
  end

  describe 'bipoc?' do
    it 'is false if white' do
      author = create(:author, ethnicity: Constants::ETHNICITIES[:white])
      expect(author.bipoc?).to be false
    end

    it 'is true if latinx' do
      author = create(:author, ethnicity: Constants::ETHNICITIES[:latinx])
      expect(author.bipoc?).to be true
    end
  end
end