require 'spec_helper'

feature "user can invite another user", feature: true do

  let!(:house) { FactoryGirl.create(:house) }
  let(:current_user) { house.users.first }

  before do
    @user = current_user
    sign_in_through_view(@user)
  end

  it "displays the invite roommates form" do
    click_button "Invite user"
    expect(page).to have_button "Invite"
  end

end