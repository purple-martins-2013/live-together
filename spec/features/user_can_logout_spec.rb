require 'spec_helper'

feature 'user can logout', feature: true do

  let(:user) { FactoryGirl.create(:user) }

  it "successfully logs out" do
    sign_in_through_view(user)
    sign_out_through_view
    expect(page).to have_content "Sign in"
  end
end