require 'spec_helper'

describe CompletedChoresController do
  describe "#index" do
    it "should assign the correct instance variable" do
      get :index
      expect(assigns(:completed_chores)).not_to eq nil
    end
  end
end