# == Schema Information
#
# Table name: productions
#
#  id          :bigint           not null, primary key
#  closing     :date
#  name        :string
#  opening     :date
#  rehearsal   :date
#  type        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_productions_on_location_id  (location_id)
#  index_productions_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_id => locations.id)
#  fk_rails_...  (user_id => users.id)
#
class Production < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates :name, uniqueness: { scope: :user }, presence: true
end
