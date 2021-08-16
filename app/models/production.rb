# frozen_string_literal: true

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
#  show_id     :bigint           not null
#
# Indexes
#
#  index_productions_on_location_id  (location_id)
#  index_productions_on_show_id      (show_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_id => locations.id)
#  fk_rails_...  (show_id => shows.id)
#
class Production < ApplicationRecord
  belongs_to :show
  belongs_to :location

  validates :name, uniqueness: { scope: :show }, presence: true
end
