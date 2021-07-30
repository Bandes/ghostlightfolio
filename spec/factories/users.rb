FactoryBot.define do
  factory :user do
    first_name { 'First' }
    last_name { 'Last' }
    sequence(:email) { |n| "email_#{n}@example.com"}
    password { 'password' }
  end

  trait :admin do
    admin { true }
  end
end