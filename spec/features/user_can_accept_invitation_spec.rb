require 'spec_helper'

feature "user can accept invitation" do

  let(:house) { FactoryGirl.create(:house) }
  let(:current_user) { house.users.first }
  let(:invitation) { FactoryGirl.create(:invitation, user: current_user ) }
  let(:roomate) { FactoryGirl.create(:user, email: invitation.email ) }

  before do
    sign_in_through_view(roomate)
  end

  it "should be able to view the invitation on the new house page" do
    expect(page).to have_content house.name
  end

  xit "should be able to accept the invitation and view the house dash" do
    click_link "Accept"
    expect(page).to have_content house.name
    expect(page).to have_content house.address
  end
end