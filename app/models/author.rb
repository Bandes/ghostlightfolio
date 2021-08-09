# frozen_string_literal: true

# == Schema Information
#
# Table name: authors
#
#  id              :bigint           not null, primary key
#  author_code     :string
#  ethnicity       :string
#  first_name      :string
#  gender_identity :string
#  last_name       :string
#  lgbt            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Author < ApplicationRecord
  has_person_name

  has_many :credits, dependent: :destroy
  has_many :shows, through: :credits

  validates :first_name, uniqueness: { scope: :last_name }, presence: true
  validates :last_name, uniqueness: { scope: :first_name }, presence: true

  def self.names
    Author.all.map { |author| [author.name.full, author.id] }
  end

  def bipoc?
    ethnicity != Constants::ETHNICITIES[:white]
  end
end
