# == Schema Information
#
# Table name: french_scenes
#
#  id           :bigint           not null, primary key
#  description  :string
#  name         :string
#  page_numbers :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  scene_id     :bigint           not null
#
# Indexes
#
#  index_french_scenes_on_scene_id  (scene_id)
#
# Foreign Keys
#
#  fk_rails_...  (scene_id => scenes.id)
#
class FrenchScene < ApplicationRecord
  belongs_to :scene
  has_one :act, through: :scene
  has_one :show, through: :act
  has_many :role_appearances, as: :roleable, dependent: :destroy
  has_many :roles, through: :role_appearances

  validates :name, presence: true, uniqueness: { scope: :scene }
end
