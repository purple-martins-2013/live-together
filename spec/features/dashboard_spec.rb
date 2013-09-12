require 'spec_helper'

feature 'Dashboard', feature: true, js: true do

  before do
    @house = FactoryGirl.create(:house)
    @user = @house.users.first
    @chore = @house.chores.create(title: 'fizz', frequency: 7, points: 15)
    sign_in_through_view @user
  end

  describe "chores" do
    it "correctly displays the chores index" do
      expect(page).to have_content @chore.title
      expect(page).to have_content @chore.points
    end

    describe "completing a chore" do
      before do
        click_button "Complete!"
      end

      it "displays the completed chore on the completed chores view and updates users points" do
        click_button "Completed chores"
        expect(page).to have_content "Completed at"
        expect(page).to have_content @chore.title
        expect(page).to have_css("#rightUpperPanel td", :text => @chore.points)
      end
    end

    describe "adding a chore" do
      before do
        click_button "Add chore"
        fill_in "title", with: "Created chore"
        fill_in "points", with: 177
        choose "chore_frequency_7"
        click_button "Submit"
      end

      it "displays the newly added chore" do
        expect(page).to have_content "Created chore"
        expect(page).to have_content 177
      end
    end
  end
end