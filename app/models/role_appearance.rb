# frozen_string_literal: true

# == Schema Information
#
# Table name: role_appearances
#
#  id            :bigint           not null, primary key
#  roleable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  role_id       :bigint           not null
#  roleable_id   :bigint           not null
#
# Indexes
#
#  index_role_appearances_on_role_id   (role_id)
#  index_role_appearances_on_roleable  (roleable_type,roleable_id)
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#
class RoleAppearance < ApplicationRecord
  belongs_to :roleable, polymorphic: true
  belongs_to :role

  validates :roleable, :role, presence: true
end
