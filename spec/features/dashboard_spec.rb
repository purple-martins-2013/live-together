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

    it "can toggle between chores and completed chores" do
      click_button "Completed chores"
      expect(page).to have_content "Completed chores"
      click_button "View chores"
      expect(page).to have_content "Chores"
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

  describe "grocery lists" do
    describe "adding a list" do
      before do
        click_button "Add list"
        fill_in "name", with: "Test list"
        click_button "Create"
      end

      it "adds the new list to the index view and hides the form" do
        expect(page).to have_css("li", text: "Test list")
        expect(page).not_to have_css('.new-list-form')
      end

      describe "viewing the added list" do
        before do
          click_link "Test list"
        end

        it "displays the correct list and add item form" do
          expect(page).to have_css('h3', text: "Test list")
          click_button "Add item"
          expect(page).to have_css('.new-item-form')
        end

        it "can add items to the list" do
          click_button "Add item"
          fill_in "name", with: "A test item"
          click_button "Create"
          expect(page).to have_css('#itemsContainer li', text: "A test item")
          expect(page).not_to have_css('.new-item-form')
        end
      end
    end
  end
end