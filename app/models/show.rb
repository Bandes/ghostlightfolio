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
end
