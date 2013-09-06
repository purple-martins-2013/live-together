require 'spec_helper'

describe HousesController do

  let(:house) { FactoryGirl.create(:house) }

  before do
    @user = FactoryGirl.create(:user)
  end

  describe "#show" do
    context "while logged in" do

      before do
        sign_in @user
      end

      context "without a house assigned to the user" do
        it "should redirect to the #new action" do
          get :show, id: house.id
          expect(response).to redirect_to(new_house_path)
        end
      end

      context "with a house assigned to the user" do

        before do
          @user.house = house
          @user.save
          get :show, id: house.id
        end

        it "should render the show house view" do
          expect(response).to render_template 'houses/show'
        end

        it "should assign the correct instance variables" do
          expect(assigns(:house)).not_to eq nil
          expect(assigns(:invitation)).not_to eq nil
        end
      end
    end

    context "while not logged in" do
      it "should redirect to the login form" do
        get :show, id: house.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#new" do
    context "while logged in" do

      before do
        sign_in @user
      end

      it "builds a @house" do
        get :new
        expect(assigns(:house)).not_to eq nil
      end
    end

    context "while not logged in" do
      it "should redirect to the login form" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#create" do
    context "while logged in" do

      before do
        sign_in @user
      end

      it "should create a new house" do
        expect do
          post :create, house: FactoryGirl.attributes_for(:house)
        end.to change { House.count }.by(1)
      end
    end

    context "while not logged in" do
      it "should not create a new house" do
        expect do
          post :create, house: FactoryGirl.attributes_for(:house)
        end.not_to change { House.count }
      end
    end
  end
end