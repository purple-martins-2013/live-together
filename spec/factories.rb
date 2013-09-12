FactoryGirl.define do

  sequence :email do |n|
    "email#{n}#{rand(20000)}@factory.com"
  end

  factory :user do
    email
    name 'Test User'
    password 'password'
    password_confirmation 'password'

    factory :user_with_house do
      house
    end

  end

  factory :authentication do
    user
    provider "facebook"
    uid "test uid string"
    token "test token string"
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
    email
    user
  end

  factory :expense do
    sequence(:name) {|n| "Expense #{n}"}
    purchaser { FactoryGirl.create(:user_with_house) }
    description "Expense description"
    total 10.00
    purchased_on Date.today
  end

  factory :payment do
    borrower_id { create(:user).id }
    # expense
    lender_id { create(:user).id }
    description "Payment description"
    amount 500.00
    date Date.today
    method "cash"
  end
end

