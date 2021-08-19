# frozen_string_literal: true

# == Schema Information
#
# Table name: shows
#
#  id            :bigint           not null, primary key
#  description   :string
#  name          :string
#  public_domain :boolean
#  rights_holder :string
#  show_code     :string
#  year_written  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Show < ApplicationRecord
  has_many :productions, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :authors, through: :credits

  validates :name, presence: true
  validates :year_written, numericality: { only_integer: true, allow_nil: true }, length: { maximum: 4 }

  scope :ethnicity_search, ->(value){ joins(credits: { author: :credits }).includes(:authors, :credits).where("authors.ethnicity @> ?", "{#{value}}") }

  def authors_for_display
    author_array = authors.uniq.map { |author| author.name.full }
    author_array.join(', ')
  end

  def self.ransackable_scopes
    %i(ethnicity_search)
  end

end
