require 'spec_helper'

describe ChoresController do
  let(:user) { FactoryGirl.create(:user) }
  let(:chore) {create :chore}

  describe "#index" do
    it { should route(:get, '/chores').to(action: :index) }

    it "should list all chores" do
      get 'index'
      assigns(:chores).should eq Chore.all
    end
  end

  describe "#new" do
    it { should route(:get, 'chores/new').to(action: :new)}
  end

  describe "#create" do 
    it { should route(:post, 'chores').to(action: :create)}

    context "when user logged in" do
      before do
        # user_session[:user_id] = user.id
        sign_in user
      end


      context "with chore and frequency filled out" do
        it "should create a chore" do
          expect { post :create, {chore: attributes_for(:chore) } }.to change(Chore.all.last)
        end
      end

      context "with chore and frequency not filled out" do
        it "should not create a chore" do
          expect { post :create, { } }.not_to change(Chore.count)
        end

        it "should raise an error" do
          post :create, {content: { } }
          expect(response.status).to eq 422
        end
      end

    end

    context "when user is not logged in" do
      it "should not create a chore" do
        user_session[:user_id] = nil
        expect { post :create, {chore: attributes_for(:chore) } }.not_to change(Chore.count)
      end
    end
  end
end
