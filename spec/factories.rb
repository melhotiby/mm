FactoryGirl.define do

  factory :user do
    first_name 'John'
    last_name  'Doe'
    sequence(:email) { |n| "name#{n}@test.com" }
    password 'testing123'
  end

end