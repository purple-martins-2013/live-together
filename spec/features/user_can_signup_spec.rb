require 'spec_helper'

feature "user can sign up", feature: true do

  let(:user) { FactoryGirl.build(:user) }

  before do
    visit new_user_registration_path
  end

  it "successfully displays the form page" do
    expect(page).to have_content "Sign up"
  end

  it "successfully creates a new user with valid info" do
    sign_up_through_view(user)
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Welcome!'
  end
end