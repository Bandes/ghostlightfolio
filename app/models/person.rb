class Person < ApplicationRecord

  has_person_name
  belongs_to :user

end
