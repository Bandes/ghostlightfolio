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
#  lgbt            :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Author < ApplicationRecord
  has_person_name

  has_many :shows, dependent: :destroy
  
	validates :first_name, uniqueness: { scope: :last_name }, presence: true
	validates :last_name, uniqueness: { scope: :first_name }, presence: true

	def self.names
		Author.all.map { |author| [author.name.full, author.id] }
	end

	def bipoc?
		ethnicity != Constants::ETHNICITIES[:white]
	end

end
