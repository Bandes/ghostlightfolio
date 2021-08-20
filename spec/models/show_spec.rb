# == Schema Information
#
# Table name: shows
#
#  id            :bigint           not null, primary key
#  description   :string
#  genre         :string
#  name          :string
#  public_domain :boolean
#  rights_holder :string
#  show_code     :string
#  show_type     :string
#  year_written  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe Show, type: :model do

  it 'validates name' do
    show = build(:show, name: nil)
    expect(show.valid?).to be false
    expect(show.errors.full_messages).to include("Name can't be blank")
  end

  it 'validates year_written is a number' do
    show = build(:show, year_written: 'abcde')
    expect(show.valid?).to be false    
    expect(show.errors.full_messages).to include('Year written is not a number')
  end

  it 'validates year_written is a less than 4 characters' do
    show = build(:show, year_written: '12345')
    expect(show.valid?).to be false    
    expect(show.errors.full_messages).to include('Year written is too long (maximum is 4 characters)')
  end

  it 'returns a string of author names' do
    show = create(:show, name: 'Lady Wolfman')
    author1 = create(:author, first_name: 'Charles', last_name: 'Bandes')
    author2 = create(:author, first_name: 'George', last_name: 'Washington')

    show.authors << author1
    show.authors << author2

    expect(show.authors_for_display).to eq('Charles Bandes, George Washington')
  end

  it 'ransackable_scopes' do
    expect(described_class.ransackable_scopes).to eq([:ethnicity_search])
  end
end
