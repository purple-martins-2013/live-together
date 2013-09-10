require 'spec_helper'

describe SettlementsController do

  let(:house) { FactoryGirl.create(:house) }
  let(:user) { house.users.first }

  let(:settlement) { create(:settlement, contributor: user) }

  context "while logged in" do

    before do
      sign_in user
    end

    describe "#index" do

      it { should route(:get, '/settlements').to(action: :index) }

      it "should list all settlements" do
        get :index
        assigns(:settlements).should eq(user.settlements.load)
      end
    end

    describe "#show" do

      it "shows the individual settlement" do
        get :show, id: settlement
        expect(assigns(:settlement)).to eq settlement
        expect(response).to render_template :show
      end
    end

    describe "#new" do

      it { should route(:get, 'settlements/new').to(action: :new)}

      it "displays the new settlement form" do
        get :new
        expect(assigns(:settlement)).not_to eq nil
        expect(response).to render_template 'settlements/new'
      end
    end


    describe "#create" do

      it { should route(:post, 'settlements').to(action: :create)}

      before do
        request.env["HTTP_REFERER"] = root_path
      end

      context "with amount_cents and date_paid filled out" do
        it "creates an settlement" do
          expect { post :create, {settlement: attributes_for(:settlement) } }.to change{Settlement.count}.by(1)
        end
      end

      context "with amount_cents and date_paid not filled out" do
        it "does not create an settlement" do
          expect { post :create, {settlement: {amount_cents: '', date_paid: ''}} }.not_to change{Settlement.count}
        end
      end
    end

    describe "#update" do

      before do
        request.env["HTTP_REFERER"] = chores_path
      end

      it "should update the date_paid attribute of settlement" do
        patch :update, id: settlement, settlement: {date_paid: Date.today }
        expect(settlement.reload.date_paid).to eq Date.today
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
        get :show, id: settlement
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
      it "should not create a settlement" do
        expect { post :create, {settlement: attributes_for(:settlement) } }.not_to change{Chore.count}
      end
    end
  end
end
