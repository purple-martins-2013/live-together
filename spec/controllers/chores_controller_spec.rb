require 'spec_helper'

describe ChoresController do

  before(:all) do
    @user = FactoryGirl.create(:user)
    @house = FactoryGirl.create(:house)
    @chore = @house.chores.create(title: 'fizz', frequency: 7, points: 20)
    @user.house = @house
    @user.save
  end

  describe "#index" do
    it { should route(:get, '/chores').to(action: :index) }

    it "should list all chores" do

      sign_in @user
      get :index

      assigns(:chores).should eq(@house.chores.load)
    end
  end

  describe "#show" do
    context "when logged in" do

      before do
        sign_in @user
      end

      it "should show the individual chore" do
        get :show, id: @chore.id
        expect(assigns(:chore)).to eq @chore
        expect(response).to render_template "chores/show"
      end
    end

    context "when not logged in" do
      it "should redirect to the sign in page" do
        get :show, id: @chore.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#new" do
    it { should route(:get, 'chores/new').to(action: :new)}

    context "when logged in" do

      before do
        sign_in @user
      end

      it "should display the new chore form" do
        get :new
        expect(assigns(:chore)).not_to eq nil
        expect(response).to render_template 'chores/new'
      end
    end

    context "when not logged in" do
      it "should redirect to the sign in page" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#create" do
    it { should route(:post, 'chores').to(action: :create)}

    context "when user logged in" do

      before do
        sign_in @user
      end

      context "with chore and frequency filled out" do
        it "should create a chore" do
          expect { post :create, {chore: attributes_for(:chore) } }.to change{Chore.count}.by(1)
        end
      end

      context "with chore and frequency not filled out" do
        it "should not create a chore" do
          expect { post :create, {chore: {title: '', frequency: ''}} }.not_to change{Chore.count}
        end

        it "should display the new chore form again" do
          post :create, chore: {title: '', frequency: ''}
          expect(response).to render_template 'chores/new'
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
