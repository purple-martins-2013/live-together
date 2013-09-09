require 'spec_helper'

describe GroceryItemsController do
  let(:grocery_item) { FactoryGirl.create(:grocery_item) }
  let(:grocery_list) { grocery_item.grocery_list }
  let(:house) { grocery_list.house }
  let(:user) { house.users.first }

  context "while logged in" do

    before do
      sign_in user
    end

    describe "#new" do

      it "renders the 'new' view" do
        get :new, {grocery_item: attributes_for(:grocery_item), grocery_list_id: grocery_list.id}
        expect(response).to be_success
      end
    end

    describe "#create" do

      context "when I try to create a grocery_item with empty params" do

        it "renders the grocery_item new page" do
          post :create, grocery_list_id: grocery_list.id, grocery_item: {name: "" }
          expect(response).to redirect_to(new_grocery_list_grocery_item_path)
        end

        it "does not save the new grocery item" do
          expect{
            post :create, grocery_list_id: grocery_list.id, grocery_item: {name: "" }
          }.to_not change { GroceryItem.count }
        end
      end

      context "when I try to create a grocery_item with complete params" do
        it "should redirect back to list page with item posted" do
          post :create, { grocery_item: attributes_for(:grocery_item), grocery_list_id: grocery_list.id}
          expect(response).to redirect_to(grocery_list_path(grocery_list))
        end

        it "creates a new grocery_item" do
          expect do
            post :create, { grocery_item: attributes_for(:grocery_item), grocery_list_id: grocery_list.id}
          end.to change { GroceryItem.count }.by(1)
        end
      end

      context "when I try to create a grocery_item with a name that already exists in that list" do
        it "redirects to grocery list index" do
          post :create, grocery_list_id: grocery_list.id, grocery_item: {name: "" }
          expect(response).to redirect_to(new_grocery_list_grocery_item_path)
        end


      end

    end

    describe "#delete" do
      it { should route(:delete, '/grocery_items/1').to(action: :destroy, id: 1) }

      it "deletes a grocery_item" do
        delete :destroy, :id => grocery_item
        GroceryItem.find_by_id(grocery_item.id).should be_nil
      end

      it "redirects to the grocery lists index" do
        delete :destroy, :id => grocery_item.id
        response.should redirect_to grocery_lists_path
      end
    end
  end

  context "while not logged in" do
    describe "#new" do
      it "redirects to the login form" do
        get :new, {grocery_item: attributes_for(:grocery_item), grocery_list_id: grocery_list.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
