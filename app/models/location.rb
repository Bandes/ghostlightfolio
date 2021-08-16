# frozen_string_literal: true

# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  address    :string
#  capacity   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_locations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Location < ApplicationRecord
  belongs_to :user
  has_many :productions, dependent: :destroy

  validates :name, uniqueness: { scope: :user }, presence: true
end
