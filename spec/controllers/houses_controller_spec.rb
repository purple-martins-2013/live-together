require 'spec_helper'

describe HousesController do

  let(:house) { FactoryGirl.create(:house) }
  let(:user) { house.users.first }


  describe "#show" do
    context "while logged in" do

      context "without a house assigned to the user" do
        it "redirects to the #new action" do
          user_without_house = FactoryGirl.create(:user)
          sign_in user_without_house
          get :show, id: house.id
          expect(response).to redirect_to(new_house_path)
        end
      end

      context "with a house assigned to the user" do

        before do
          sign_in user
        end

        it "renders the show house view" do
          get :show, id: house.id
          expect(response).to render_template 'houses/show'
        end

        it "assigns the correct instance variables" do
          get :show, id: house.id
          expect(assigns(:house)).not_to eq nil
          expect(assigns(:invitation)).not_to eq nil
        end
      end
    end

    context "while not logged in" do
      it "redirects to the login form" do
        get :show, id: house.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#new" do
    context "while logged in" do

      it "assigns a new house" do
        sign_in user
        get :new
        expect(assigns(:house)).not_to eq nil
      end
    end

    context "while not logged in" do
      it "redirects to the login form" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#create" do
    context "while logged in" do

      it "creates a new house" do
        sign_in user
        expect do
          post :create, house: FactoryGirl.attributes_for(:house)
        end.to change { House.count }.by(1)
      end

      it "not increase House.count if improper attributes" do
        sign_in user
        expect do
          post :create, { house: {name: '', address: '123 Street'}}
        end.to change { House.count }.by(0)
      end

    end

    context "while not logged in" do
      it "does not create a new house" do
        expect do
          post :create, house: FactoryGirl.attributes_for(:house)
        end.not_to change { House.count }
      end
    end
  end
end