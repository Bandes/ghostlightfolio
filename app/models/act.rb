# == Schema Information
#
# Table name: acts
#
#  id           :bigint           not null, primary key
#  description  :string
#  name         :string
#  page_numbers :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  show_id      :bigint           not null
#
# Indexes
#
#  index_acts_on_show_id  (show_id)
#
# Foreign Keys
#
#  fk_rails_...  (show_id => shows.id)
#
class Act < ApplicationRecord
  belongs_to :show
  has_many :role_appearances, as: :roleable, dependent: :destroy
  has_many :roles, through: :role_appearances
  has_many :scenes, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :show }
end
