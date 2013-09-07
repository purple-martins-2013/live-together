require 'spec_helper'

feature 'Chores Layouts' do

  before(:all) do
    @user = FactoryGirl.create(:user)
    @house = FactoryGirl.create(:house)
    @chore = @house.chores.create(title: 'fizz', frequency: 7, points: 15)
    @user.house = @house
    @user.save
  end

  context "on chore index" do
    before(:each) do
      sign_in_through_view(@user)
    end

    it "displays Chore List" do
      visit chores_path
      expect(page).to have_content "Chore List"
      expect(page).to have_content @chore.title
    end

    it "has a link to specific chore" do
      visit chores_path
      click_link @chore.title
      expect(page).to have_content @chore.title
    end

    it "redirects to sign-in page if try to go to /chores without being logged in" do
      sign_out_through_view
      visit chores_path
      expect(page).to have_content "Sign in"
    end
  end


  context "on create chore form" do
    before(:each) do
      sign_in_through_view(@user)
    end

    it "creates a new chore with valid data" do
      visit new_chore_path
      fill_in "chore_title", with: @chore.title
      choose "Weekly"
      fill_in "chore_points", with: @chore.points
      click_button "Create Chore"
      expect(page).to have_content @chore.title
    end

    it "should not create a chore with invalid data" do
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
