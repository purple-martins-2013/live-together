require 'spec_helper'

describe ExpensesController do

  let(:house) { FactoryGirl.create(:house) }
  let(:user) { house.users.first }

  let(:expense) { create(:expense, purchaser: user) }
  let(:debt) {create(:debt, borrower: user)}

  context "while logged in" do

    before do
      sign_in user
    end

    describe "#index" do

      it { should route(:get, '/expenses').to(action: :index) }

      it "should list all your debts" do
        get :index
        assigns(:user_debts).should eq(Debt.where( borrower: user))
      end

      it "should list all house expenses" do
        get :index
        assigns(:house_expenses).should eq(Expense.where( purchaser_id: house.users))

      end

      it "should render the 'index' view" do
        get :index
        expect(response).to render_template 'expenses/index'
      end
    end

    describe "#show" do

      it "shows the individual expense" do
        get :show, id: expense
        expect(assigns(:expense)).to eq expense
        expect(response).to render_template :show
      end
    end

    describe "#new" do

      it { should route(:get, 'expenses/new').to(action: :new)}

      it "displays the new expense form" do
        get :new
        expect(assigns(:expense)).not_to eq nil
        expect(response).to render_template 'expenses/new'
      end
    end


    describe "#create" do

      it { should route(:post, 'expenses').to(action: :create)}

      before do
        request.env["HTTP_REFERER"] = root_path
      end

      context "with name, total, and purchased_on filled out" do
        it "creates an expense" do
          expect { post :create, {expense: attributes_for(:expense) } }.to change{Expense.count}.by(1)
        end
      end

      context "with name, total, and purchased_on not filled out" do
        it "does not create an expense" do
          expect { post :create, {expense: {name: '', total: ''}} }.not_to change{Expense.count}
        end
      end
    end

    describe "#delete" do

      before :each do
        @expense = create(:expense)
      end

      it "should delete an expense" do
        expect {
          delete :destroy, id: @expense
        }.to change {Expense.count}.by(-1)
      end

      it "redirects to the expense index" do
        delete :destroy, id: @expense
        response.should redirect_to expenses_path
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
        get :show, id: expense
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
      it "should not create a expense" do
        expect { post :create, {expense: attributes_for(:expense) } }.not_to change{Chore.count}
      end
    end
  end
end
