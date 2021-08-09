# frozen_string_literal: true

# == Schema Information
#
# Table name: shows
#
#  id             :bigint           not null, primary key
#  copyright_year :date
#  description    :string
#  name           :string
#  public_domain  :boolean
#  show_code      :string
#  year_written   :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Show < ApplicationRecord
  has_many :productions, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :authors, through: :credits

  validates :name, uniqueness: true, presence: true

  def authors_for_display
    author_array = authors.map { |author| author.name.full }
    author_array.join(", ")
  end

end
