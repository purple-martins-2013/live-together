require 'spec_helper'

feature "user can invite another user" do

  before do
    @user = FactoryGirl.create(:user)
    @house = FactoryGirl.create(:house)
    @user.house = @house
    @user.save
    sign_in_through_view(@user)
  end

  it "should display the invite roommates form" do
    expect(page).to have_content "Invite roommates"
  end

  it "should create a new invitation" do
    fill_in "invitation_email", with: "test@test.com"
    click_button "Send invitation"
    expect(page).to have_content "Invitation sent to test@test.com"
  end

end