FactoryGirl.define do

  sequence :email do |n|
    "email#{n}#{rand(20000)}@factory.com"
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
    email
    user
  end

  factory :expense do
    sequence(:name) {|n| "Expense #{n}"}
    description "Expense description"
    total_cents 1000
    purchased_on Date.today
    user
  end

  factory :settlement do
    amount_cents 500
    date_paid Date.today
    expense
    grocery_list
    user
  end
end

