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
#
require 'rails_helper'

RSpec.describe Show, type: :model do

  it 'validates name' do
    show = build(:show, name: nil)
    expect(show.valid?).to be false
    expect(show.errors.full_messages).to include("Name can't be blank")
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
