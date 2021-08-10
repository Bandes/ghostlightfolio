# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id              :bigint           not null, primary key
#  age_max         :integer
#  age_min         :integer
#  description     :string
#  ethnicity       :string
#  gender_identity :string
#  lgbt            :boolean          default(FALSE)
#  name            :string
#  strong_dancer   :boolean          default(FALSE)
#  strong_singer   :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  show_id         :bigint           not null
#
# Indexes
#
#  index_roles_on_show_id  (show_id)
#
# Foreign Keys
#
#  fk_rails_...  (show_id => shows.id)
#
class Role < ApplicationRecord
  belongs_to :show

  validates :name, uniqueness: { scope: :show }, presence: true
  validates :show_id, presence: true
end
