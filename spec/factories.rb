FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email
    password 'password'
    password_confirmation 'password'
  end

  factory :chore do
    sequence(:title) {|n| "Title #{n}"}
    sequence(:frequency) {|n| "Every #{n} days"} 
  end
end
