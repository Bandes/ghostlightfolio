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
class Credit < ApplicationRecord
  belongs_to :author
  belongs_to :show
end
