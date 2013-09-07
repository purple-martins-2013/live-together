require 'spec_helper'

feature "user can accept invitation" do

  before do
    @user = FactoryGirl.create(:user)
    @house = FactoryGirl.create(:house)
    @invitation = Invitation.create(email: @user.email, house_id: @house.id )
    sign_in_through_view(@user)
  end

  it "should be able to view the invitation on the new house page" do
    expect(page).to have_content @house.name
  end

  it "should be able to accept the invitation and view the house dash" do
    click_link "Accept"
    expect(page).to have_content "Welcome to the app!"
    expect(page).to have_content @house.address
  end
end