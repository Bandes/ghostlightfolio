# == Schema Information
#
# Table name: authors
#
#  id              :bigint           not null, primary key
#  author_code     :string
#  ethnicity       :string           default([]), is an Array
#  first_name      :string
#  gender_identity :string
#  last_name       :string
#  lgbt            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'validates presence of first_name and last_name if both are blank' do
    author = build(:author, first_name: nil, last_name: nil)
    expect(author.valid?).to be false
    expect(author.errors.full_messages).to include "First name can't be blank"
    expect(author.errors.full_messages).to include "Last name can't be blank"
  end

  it 'does not validate presence of last_name if first name is present' do
    author = build(:author, last_name: nil, first_name: 'George')
    expect(author.valid?).to be true
  end

  it 'does not validate presence of first_name if last name is present' do
    author = build(:author, last_name: 'Washington', first_name: nil)
    expect(author.valid?).to be true
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
    it 'is false if caucasian' do
      author = create(:author, ethnicity: ['caucasian'])
      expect(author.bipoc?).to be false
    end

    it 'is true if latinx' do
      author = create(:author, ethnicity: ['latinx'])
      expect(author.bipoc?).to be true
    end
  end

  describe 'bipoc scope' do
    it 'only returns bipoc authors' do
      caucasian_author = create(:author, ethnicity: ['caucasian'])
      latin_author = create(:author, ethnicity: ['latinx'])
      unspecified_author = create(:author, ethnicity: [])

      expect(Author.bipoc).to match_array [latin_author]
    end
  end

  describe 'page_number' do
    it 'returns the correct page number' do
      author = create(:author)
      expect(author.page_number(by: :last_name)).to eq 1
    end
  end

  it 'ransackable_scopes' do
    expect(described_class.ransackable_scopes).to eq([:ethnicity_search])
  end
end
