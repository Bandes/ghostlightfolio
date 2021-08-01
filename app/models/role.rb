# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id            :bigint           not null, primary key
#  description   :string
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  person_id     :bigint           not null
#  production_id :bigint           not null
#
# Indexes
#
#  index_roles_on_person_id      (person_id)
#  index_roles_on_production_id  (production_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_id => people.id)
#  fk_rails_...  (production_id => productions.id)
#
class Role < ApplicationRecord
  belongs_to :production
  belongs_to :person

  validates :name, uniqueness: { scope: :production }, presence: true
end
