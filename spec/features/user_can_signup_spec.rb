require 'spec_helper'

feature "user can sign up" do

  let(:user) { FactoryGirl.build(:user) }

  before do
    visit new_user_registration_path
  end

  it "successfully displays the form page" do
    expect(page).to have_content "Sign up"
  end

  it "successfully creates a new user with valid info" do
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content 'Logout'
    expect(page).to have_content 'Welcome!'
  end

  it "displays an error message when a user is created without valid info" do
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign up'
    expect(page).to have_content 'error'
  end

end