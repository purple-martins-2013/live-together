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
    address "22 test st."
  end


  factory :user_with_house, parent: :user do
    house
  end


  factory :grocery_list do
    name "List"
  end
end