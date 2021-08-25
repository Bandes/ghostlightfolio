# frozen_string_literal: true

# == Schema Information
#
# Table name: authors
#
#  id              :bigint           not null, primary key
#  author_code     :string
#  ethnicity       :string           default([]), is an Array
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

  validates :first_name, uniqueness: { scope: :last_name }
  validates :last_name, uniqueness: { scope: :first_name }

  validates :first_name, presence: true, unless: ->(author) { author.last_name.present? }
  validates :last_name, presence: true, unless: ->(author) { author.first_name.present? }

  scope :ethnicity_search, ->(value) { where('ethnicity @> ?', value) }
  scope :bipoc, -> { where.not(ethnicity: ['caucasian']).and(Author.where.not(ethnicity: [])) }

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def bipoc?
    ethnicity != ['caucasian']
  end

  def ethnicity_values
    ethnicity&.map { |key| Constants::ETHNICITIES[key.to_sym] }
  end

  def gender_value
    Constants::GENDER_IDENTITIES[gender_identity&.to_sym]
  end

  def self.ransackable_scopes
    %i[ethnicity_search]
  end

  alias to_label full_name
end
