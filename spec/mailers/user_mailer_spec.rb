require 'spec_helper'
describe UserMailer do

  describe "#welcome_mail" do
    it "Sends an email!" do
      user = FactoryGirl.create(:user_with_house)
      invitation = FactoryGirl.create(:invitation, user: user)

      mail = UserMailer.invitation_email(invitation).deliver

      mail.should  have_subject /Someone invited you to join Live-Together/
      mail.should have_body_text /#{accept_invitation_url(invitation)}/
    end
  end
end
