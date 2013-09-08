FactoryGirl.define do

  sequence :email do |n|
    "email#{n}#{rand(2000)}@factory.com"
  end

  factory :user do
    email
    password 'password'
    password_confirmation 'password'
  end

  factory :house do
    name "House"
    address "22 Test St."
    users { [FactoryGirl.create(:user)] }
  end

  factory :chore do
    sequence(:title) {|n| "Title #{n}"}
    frequency 7
    house
    points 20
  end

  factory :grocery_list do
    sequence(:name) {|n| "List #{n}"}
    house
  end

  factory :grocery_item do
    sequence(:name) {|n| "Item #{n}"}
    grocery_list
  end

  factory :invalid_grocery_list, parent: :grocery_list do
    name nil
  end

  factory :invitation do
    email "test@factory.com"
    house
  end
end

