require 'spec_helper'

describe CompletedChoresController do

  let(:house) { FactoryGirl.create(:house) }

  describe "#index" do

    before do
      sign_in house.users.first
    end

    it "should assign the correct instance variable" do
      get :index
      expect(assigns(:completed_chores)).not_to eq nil
    end
  end
end