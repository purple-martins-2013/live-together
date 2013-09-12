require 'spec_helper'

describe PaymentsController do

  let(:house) { FactoryGirl.create(:house) }
  let(:user) { house.users.first }
  let(:user2) { house.users.last }

  let(:expense) { create(:expense, purchaser: user) }
  let(:debt) {create(:debt, borrower: user)}
  let(:payment) { create(:payment, borrower: user, lender: user2) }

  context "while logged in" do

    before do
      sign_in user
    end

    describe "#index" do

      it { should route(:get, '/payments').to(action: :index) }

      it "should list all your payments" do
        get :index
        assigns(:payments).should eq(user.settlements)
      end

      it "should list all house settlements" do
        get :index
        assigns(:settlements).should eq(Payment.where( borrower_id: user.id))

      end

      it "should render the 'index' view" do
        get :index
        expect(response).to render_template 'payments/index'
      end
    end

    describe "#show" do

      it "shows the individual payment" do
        get :show, id: payment
        expect(assigns(:payment)).to eq payment
      end
    end

    describe "#new" do

      it { should route(:get, 'payments/new').to(action: :new)}

    end

    describe "#create" do

      it { should route(:post, 'payments').to(action: :create)}

      before do
        request.env["HTTP_REFERER"] = root_path
      end

      context "with description, amount, date, and method filled out" do
        it "creates an payment" do
          expect { post :create, {payment: attributes_for(:payment) } }.to change{Payment.count}.by(1)
        end
      end

      context "with description, amount, date, and/or method filled out not filled out" do
        it "does not create an payment" do
          expect { post :create, {payment: {description: '', amount: ''}} }.not_to change{Payment.count}
        end


      end
    end

    describe "#delete" do

      before :each do
        @payment = create(:payment)
      end

      it "should delete a payment" do
        expect {
          delete :destroy, id: @payment
        }.to change {Payment.count}.by(-1)
      end

      it "redirects to the payment index" do
        delete :destroy, id: @payment
        response.should redirect_to payments_path
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
        get :show, id: payment
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
      it "should not create a payment" do
        expect { post :create, {payment: attributes_for(:payment) } }.not_to change{Chore.count}
      end
    end
  end
end
