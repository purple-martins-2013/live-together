require 'spec_helper'

feature 'Chores Layouts' do

  before(:all) do
    @user = FactoryGirl.create(:user)
    @house = FactoryGirl.create(:house)
    @chore = @house.chores.create(title: 'fizz', frequency: 'buzz')
    @user.house = @house
    @user.save
  end

  context "on chore index" do
    it "displays Chore List" do
      sign_in_through_view(@user)
      visit chores_path
      expect(page).to have_content "Chore List"
      expect(page).to have_content @chore.title
    end

    it "has a link to specific chore" do
      sign_in_through_view(@user)
      visit chores_path
      click_link @chore.title
      expect(page).to have_content @chore.title
    end

    it "redirects to sign-in page if try to go to /chores without being logged in" do
      visit chores_path
      expect(page).to have_content "Sign in"
    end
  end


  context "on create chore form" do
    it "creates a new chore with valid data" do
      sign_in_through_view(@user)
      visit new_chore_path
      fill_in "chore_title", with: @chore.title
      fill_in "chore_frequency", with: @chore.frequency
      click_button "Create Chore"
      expect(page).to have_content @chore.title
    end

    it "should not create a chore with invalid data" do
      sign_in_through_view(@user)
      visit new_chore_path
      click_button "Create Chore"
      expect(page).to have_content 'error'
    end
  end

  context "user can create a chore" do
    it "should display the create chore form" do
      sign_in_through_view(@user)
      visit chores_path
      click_link 'New Chore'
      expect(page).to have_content "New chore"
    end
  end

end
