# == Schema Information
#
# Table name: scenes
#
#  id           :bigint           not null, primary key
#  description  :string
#  name         :string
#  page_numbers :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  act_id       :bigint           not null
#
# Indexes
#
#  index_scenes_on_act_id  (act_id)
#
# Foreign Keys
#
#  fk_rails_...  (act_id => acts.id)
#
class Scene < ApplicationRecord
  belongs_to :act
  has_one :show, through: :act
  has_many :role_appearances, as: :roleable
  has_many :roles, through: :role_appearances
end
