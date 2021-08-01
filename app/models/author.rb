# == Schema Information
#
# Table name: authors
#
#  id              :bigint           not null, primary key
#  birth_year      :date
#  death_year      :date
#  ethnicity       :string
#  first_name      :string
#  gender_identity :string
#  last_name       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Author < ApplicationRecord
	validates :first_name, uniqueness: { scope: :last_name }, presence: true
	validates :last_name, uniqueness: { scope: :first_name }, presence: true
end
