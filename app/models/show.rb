# frozen_string_literal: true

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
class Show < ApplicationRecord
  has_many :productions, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :authors, through: :credits
  has_many :acts, dependent: :destroy
  has_many :scenes, through: :acts
  has_many :french_scenes, through: :scenes

  validates :name, presence: true
  validates :year_written, numericality: { only_integer: true, allow_nil: true }, length: { maximum: 4 }

  def authors_for_display
    author_array = authors.uniq.map(&:full_name)
    author_array.join(', ')
  end

  def page_number(by: :id, per: 20)
    position = Show.joins(%i[credits authors]).includes(%i[credits authors]).where("#{by} <= ?", send(by)).count
    (position.to_f / per).ceil
  end

  def columns_for_chart
    columns = roles.order(:name).map(&:name)
    columns.prepend('Acts')
  end
  
  def act_role_chart_data
    rows = []

    acts.each do |act|
      rows << calculate_row_for(scene: act)
      act.scenes.each do |scene|
        rows << calculate_row_for(scene: scene)
        scene.french_scenes.each do |french_scene|
          rows << calculate_row_for(scene: french_scene)
        end
      end
    end

    rows
  end

  private 

  def calculate_row_for(scene:)
    row = []
    roles.order(:name).each_with_index do |role, index|
      if scene.roles.include? role
        row[index] = 'X'
      else
        row[index] = 0
      end
    end
    row.prepend(scene.name)
  end

  def all_acts_and_scenes
    acts.map { |act| { act.name => scenes_for(act: act) } }
  end

  def scenes_for(act:)
    act.scenes.map { |scene| { scene.name => french_scenes_for(scene: scene) } }
  end

  def french_scenes_for(scene:)
    scene.french_scenes.map(&:name)
  end
  
end
