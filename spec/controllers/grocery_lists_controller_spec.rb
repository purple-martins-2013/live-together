require 'spec_helper'

describe GroceryListsController do

  let(:grocery_list) { FactoryGirl.create(:grocery_list) }
  let(:user) { FactoryGirl.create(:user_with_house)}
  let(:house) { user.house }

  context "while logged in" do

    before do
      sign_in user
    end

    describe "#index" do

      it "should render the 'index' view" do
        get :index
        expect(response).to render_template 'grocery_lists/index'
      end

      it "should assign all the grocery lists for the user's house" do
        house.grocery_lists << grocery_list
        get :index
        assigns(:grocery_lists).should eq([grocery_list])
      end

      it "should not assign grocery lists that don't belong to user's house " do
        get :index
        assigns(:grocery_lists).should_not include(grocery_list)
      end

    end

    describe "#show" do

      it "should render the 'show' view" do
        get :show, id: grocery_list.id
        expect(response).to render_template 'grocery_lists/show'
      end
    end

    describe "#new" do

      it "should render the 'new' view" do
        get :new
        expect(response).to render_template 'grocery_lists/new'
      end
    end

    describe "#create" do

      it "should create a new grocery_list" do
        expect do
          post :create, grocery_list: FactoryGirl.attributes_for(:grocery_list)
        end.to change { GroceryList.count }.by(1)
      end

      it "redirects to the list" do
        post :create, grocery_list: FactoryGirl.attributes_for(:grocery_list)
        response.should redirect_to GroceryList.last
      end
    end

    describe "#edit" do

      it "should render the 'edit' view" do
        get :edit, id: grocery_list.id
        expect(response).to render_template 'grocery_lists/edit'
      end
    end

    describe "#update" do

      context "valid attributes" do
        it "located the requested grocery list" do
          put :update, id: grocery_list, grocery_list: FactoryGirl.attributes_for(:grocery_list)
          assigns(:grocery_list).should eq(grocery_list)
        end

        it "changes grocery list atributes" do
          put :update, id: grocery_list, grocery_list: FactoryGirl.attributes_for(:grocery_list, name: "Some other list")
          grocery_list.reload
          grocery_list.name.should eq "Some other list"
        end

        it "redirects to the updated list" do
          put :update, id: grocery_list, grocery_list: FactoryGirl.attributes_for(:grocery_list)
          response.should redirect_to grocery_list
        end
      end
    end

    describe "#delete" do

      before :each do
        @grocery_list = FactoryGirl.create(:grocery_list)
      end

      it "should delete a grocery_lists" do
        expect {
          delete :destroy , id: @grocery_list
        }.to change {GroceryList.count}.by(-1)
      end
    end
  end
end
