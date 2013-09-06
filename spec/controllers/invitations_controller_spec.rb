require 'spec_helper'

describe InvitationsController do

  let(:invitation) { FactoryGirl.create(:invitation) }

  before(:all) do
    @user = FactoryGirl.create(:user)
    @house = FactoryGirl.create(:house)
    @user.house = @house
    @user.save
  end

  describe "#create" do
    context "when logged in" do

      before do
        sign_in @user
        request.env["HTTP_REFERER"] = house_path(@house)
      end

      it "should create an invitation with valid information" do
        expect do
          post :create, invitation: attributes_for(:invitation)
        end.to change { Invitation.count }.by(1)
      end

      it "should not create an invitation with invalid information" do
        expect do
          post :create, invitation: {email: ""}
        end.not_to change {Invitation.count}
      end
    end

    context "when not logged in" do
      it "should redirect to the sign in page" do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#accept" do
    context "when logged in" do

      before do
        sign_in @user
        @user.update_attributes(house_id: nil)
      end

      it "should assign the correct invitation instance variable" do
        get :accept, id: invitation.id
        expect(assigns(:invitation)).to eq invitation
      end

      it "should redirect to the correct house path" do
        get :accept, id: invitation.id
        expect(response).to redirect_to house_path(invitation.house_id)
      end
    end
  end

end