require 'spec_helper'

describe ChoresController do
  let(:user) { FactoryGirl.create(:user) }
  let(:chore) {create :chore}

  describe "#index" do
    before(:each) do
        @user = FactoryGirl.create(:user)
    end

    it { should route(:get, '/chores').to(action: :index) }

    it "should list all chores" do

      sign_in @user
      get :index

      assigns(:chores).should eq([chore])
    end
  end

  describe "#new" do
    it { should route(:get, 'chores/new').to(action: :new)}
  end

  describe "#create" do
    before(:each) do
        @user = FactoryGirl.create(:user)
    end
    it { should route(:post, 'chores').to(action: :create)}

    context "when user logged in" do


      context "with chore and frequency filled out" do
        it "should create a chore" do
          sign_in @user
          expect { post :create, {chore: attributes_for(:chore) } }.to change{Chore.all.last}
        end
      end

      context "with chore and frequency not filled out" do
        it "should not create a chore" do
          expect { post :create, { } }.not_to change{Chore.count}
        end

      end

    end

    context "when user is not logged in" do
      it "should not create a chore" do
        # sign_out user
        expect { post :create, {chore: attributes_for(:chore) } }.not_to change{Chore.count}
      end
    end
  end
end
