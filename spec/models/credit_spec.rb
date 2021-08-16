# == Schema Information
#
# Table name: credits
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  show_id    :bigint           not null
#
# Indexes
#
#  index_credits_on_author_id  (author_id)
#  index_credits_on_show_id    (show_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (show_id => shows.id)
#
require 'rails_helper'

RSpec.describe Credit, type: :model do
  it 'belongs to author and show' do
    author = create(:author)
    show = create(:show)
    credit = Credit.new

    credit.show = show
    credit.author = author

    expect(credit.show).to eq show
    expect(credit.author).to eq author
  end
end
