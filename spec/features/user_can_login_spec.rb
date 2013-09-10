require 'spec_helper'

feature "user can login", feature: true do

  let(:user) { FactoryGirl.create(:user) }

  before do
    visit new_user_session_path
  end

  it "successfully displays the form page" do
    expect(page).to have_content "Sign in"
  end

  it "successfully logs in a user with valid info" do
    sign_in_through_view(user)
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Signed in successfully'
  end

  it "displays an error message when a user is logged in without valid info" do
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'pass'
    click_button 'Sign in'
    expect(page).to have_content 'Invalid'
  end
end