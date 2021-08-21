# frozen_string_literal: true

# == Schema Information
#
# Table name: people
#
#  id              :bigint           not null, primary key
#  age             :integer
#  email           :string
#  ethnicity       :string           default([]), is an Array
#  first_name      :string
#  gender_identity :string
#  last_name       :string
#  lgbt            :boolean          default(FALSE)
#  notes           :string
#  phone           :string
#  strong_dancer   :boolean          default(FALSE)
#  strong_singer   :boolean          default(FALSE)
#  vocal_range     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_people_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Person < ApplicationRecord
  has_person_name
  belongs_to :user

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: { scope: :user }, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end
  
end
