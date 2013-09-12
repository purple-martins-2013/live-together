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
end