FactoryGirl.define do

  sequence :email do |n|
    "email#{n}#{rand(2000)}@factory.com"
  end

  factory :user do
    email
    password 'password'
    password_confirmation 'password'
  end

  factory :user_with_house, parent: :user do
    house
  end

  factory :house do
    name "House"
    address "22 test st."
  end

  factory :chore do
    sequence(:title) {|n| "Title #{n}"}
    sequence(:frequency) {|n| "Every #{n} days"}
    house
  end

  factory :grocery_list do
    name "List"
  end

  factory :grocery_item do
    name "peanut butter"
    grocery_list
  end

  factory :invalid_grocery_list, parent: :grocery_list do
    name nil
  end

  factory :invitation do
    email "test@factory.com"
    house_id 1
  end
end

