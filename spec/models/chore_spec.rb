require 'spec_helper'

describe Chore do

  let(:chore) { FactoryGirl.build(:chore, last_completed: Date.today) }

  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :frequency }
    it { should belong_to :house }
  end

  describe "due_date method" do
    it { should respond_to(:due_date) }

    it "should correctly add the frequency and last_completed" do
      expect(chore.due_date).to eq Date.today + 7.days
    end
  end

end
