require 'spec_helper'

feature 'Chores Layouts' do
  let(:user) { FactoryGirl.build(:user) }
  let(:house) { FactoryGirl.build(:house) }
  let!(:chore) { create :chore}

  before do
    sign_up_through_view(user)
  end

  context "on chore index" do
    it "displays Chore List" do
      visit chores_path
      expect(page).to have_content "Chore List"
      expect(page).to have_content chore.title

    end

    it "has a link to specific chore" do
      visit chores_path
      click_link chore.title
      expect(page).to have_content chore.title
    end

  end


  context "on create chore form" do
    it "creates a new chore with valid data" do
      visit new_chore_path
      fill_in "chore_title", with: chore.title
      fill_in "chore_frequency", with: chore.frequency
      click_button "Create Chore"
      expect(page).to have_content chore.title
    end

    it "should not create a chore with invalid data" do
      visit new_chore_path
      click_button "Create Chore"
      expect(page).to have_content 'error'
    end
  end

  context "user can create a chore" do
    it "should display the create chore form" do
      visit chores_path
      click_link 'New Chore'
      expect(page).to have_content "New chore"
    end
  end
end
