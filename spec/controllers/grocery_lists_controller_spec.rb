require 'spec_helper'

describe GroceryListsController do

  let(:grocery_list) { FactoryGirl.create(:grocery_list) }
  let(:house) { grocery_list.house }
  let(:user) { house.users.first }

  context "while logged in" do

    before do
      sign_in user
    end

    describe "#index" do

      it "renders the 'index' view" do
        get :index
        expect(response).to render_template 'grocery_lists/index'
      end

      it "assigns all the grocery lists for the user's house" do
        get :index
        assigns(:grocery_lists).should eq([grocery_list])
      end

      it "does not assign grocery lists that don't belong to user's house " do
        get :index
        new_grocery_list = FactoryGirl.create(:grocery_list)
        assigns(:grocery_lists).should_not include(new_grocery_list)
      end

    end

    describe "#show" do

      it "renders the 'show' view" do
        get :show, id: grocery_list
        expect(response).to render_template 'grocery_lists/show'
      end

      it "assigns the proper grocery list" do
        get :show, id: grocery_list
        assigns(:grocery_list).should eq(grocery_list)
      end

    end

    describe "#new" do

      it "renders the 'new' view" do
        get :new
        expect(response).to render_template 'grocery_lists/new'
      end
    end

    describe "#create" do

      context "with valid attributes" do

        it "creates a new grocery_list" do
          expect do
            post :create, grocery_list: FactoryGirl.attributes_for(:grocery_list)
          end.to change { GroceryList.count }.by(1)
        end

        it "redirects to the list" do
          post :create, grocery_list: FactoryGirl.attributes_for(:grocery_list)
          response.should redirect_to GroceryList.last
        end
      end

      context "with invalid attributes" do

        it "does not save the new grocery list" do
          expect{
            post :create, grocery_list: FactoryGirl.attributes_for(:invalid_grocery_list)
          }.to_not change { GroceryList.count }
        end

        it "re-renders the 'new' view" do
          post :create, grocery_list: FactoryGirl.attributes_for(:invalid_grocery_list)
          response.should render_template :new
        end

      end

      context "when I try to create a grocery_list with a name that already exists in that house" do
        it "redirects to grocery lists index" do
          post :create, house_id: house.id, grocery_list: {name: "1" }
          post :create, house_id: house.id, grocery_list: {name: "1" }
          expect(response).to redirect_to(grocery_lists_path)
        end

        it "does not save the new grocery item" do
          expect{
            post :create, house_id: house.id, grocery_list: {name: "1" }
            post :create, house_id: house.id, grocery_list: {name: "1" }
          }.to change { GroceryList.count }.by(1)
        end
      end
    end

    describe "#edit" do

      it "renders the 'edit' view" do
        get :edit, id: grocery_list.id
        expect(response).to render_template 'grocery_lists/edit'
      end

      it "assigns the proper grocery list" do
        get :edit, id: grocery_list
        assigns(:grocery_list).should eq(grocery_list)
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

      context "with invalid attributes" do

        it "does not save the new grocery list" do
          put :update, id: grocery_list, grocery_list: FactoryGirl.attributes_for(:grocery_list, name: nil)
          grocery_list.reload
          grocery_list.name.should_not eq nil
        end

        it "re-renders the 'edit' view" do
          put :update, id: grocery_list, grocery_list: FactoryGirl.attributes_for(:grocery_list, name: nil)
          expect(response).to render_template :edit
        end
      end
    end

    describe "#delete" do

      before :each do
        @grocery_list = FactoryGirl.create(:grocery_list)
      end

      it "deletes a grocery_lists" do
        expect {
          delete :destroy, id: @grocery_list
        }.to change {GroceryList.count}.by(-1)
      end

      it "redirects to the grocery lists index" do
        delete :destroy, id: @grocery_list

        response.should redirect_to grocery_lists_path
      end
    end

    describe "#subscribe" do
      before(:each) do
        post :subscribe, id: grocery_list
      end

      it "adds user to grocery list users list" do
        @user2 = create(:user)
        grocery_list.users << @user2
        grocery_list.users.should_not eq nil
      end

      it "redirects to grocery list show" do
        response.should redirect_to grocery_list_path(grocery_list)
      end
    end

    describe "#unsubscribe" do
      before(:each) do
        post :unsubscribe, id: grocery_list
      end

      it "redirects to grocey list show" do
        response.should redirect_to grocery_list_path(grocery_list)
      end

    end
  end

  context "when not logged in" do

    describe "#index" do
      it "redirects to the login form" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "#show" do
      it "redirects to the login form" do
        get :show, id: grocery_list
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "#new" do
      it "redirects to the login form" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "#edit" do
      it "redirects to the login form" do
        get :edit, id: grocery_list
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
