FactoryBot.define do
  factory :person do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    phone { "MyString" }
    user { nil }
  end
end
