require 'spec_helper'

describe ChoresController do

  let(:chore) { FactoryGirl.create(:chore) }
  let(:house) { chore.house }
  let(:user) { house.users.first }

  context "while logged in" do

    before do
      sign_in user
    end

    describe "#index" do

      it { should route(:get, '/chores').to(action: :index) }

      it "should list all chores" do
        get :index
        assigns(:chores).should eq(house.chores.load.order('due_date ASC'))
      end
    end

    describe "#show" do

      it "should show the individual chore" do
        get :show, id: chore
        expect(assigns(:chore)).to eq chore
        expect(response).to render_template "chores/show"
      end
    end

    describe "#new" do

      it { should route(:get, 'chores/new').to(action: :new)}

      it "should display the new chore form" do
        get :new
        expect(assigns(:chore)).not_to eq nil
        expect(response).to render_template 'chores/new'
      end
    end


    describe "#create" do

      it { should route(:post, 'chores').to(action: :create)}

      before do
        request.env["HTTP_REFERER"] = root_path
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
      end
    end

    describe "#update" do

      before do
        request.env["HTTP_REFERER"] = chores_path
      end

      it "should update the last_completed attribute of chore" do
        patch :update, id: chore, chore: {last_completed: Date.today }
        expect(chore.reload.last_completed).to eq Date.today
      end

      it "should create a new completed chore" do
        expect do
          patch :update, id: chore, chore: {last_completed: Date.today }
        end.to change {CompletedChore.count}.by(1)
      end
    end
  end

  context "when not logged in" do

    describe "#index" do
      it "should redirect to the login form" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "#show" do
      it "should redirect to the login form" do
        get :show, id: chore
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "#new" do
      it "should redirect to the login form" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "#create" do
      it "should not create a chore" do
        expect { post :create, {chore: attributes_for(:chore) } }.not_to change{Chore.count}
      end
    end
  end
end
