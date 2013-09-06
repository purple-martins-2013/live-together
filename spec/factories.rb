FactoryGirl.define do

  sequence :email do |n|
    "email#{n}#{rand(2000)}@factory.com"
  end

  factory :user do
    email
    password 'password'
    password_confirmation 'password'
  end

  factory :chore do
    sequence(:title) {|n| "Title #{n}"}
    sequence(:frequency) {|n| "Every #{n} days"}
    house
  end

  factory :house do
    name "House"
    address "22 test st."
  end
end

