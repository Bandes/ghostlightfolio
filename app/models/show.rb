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
#  year_written   :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :bigint
#
# Indexes
#
#  index_shows_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#
class Show < ApplicationRecord
  belongs_to :author
  has_many :productions, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
