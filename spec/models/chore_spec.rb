require 'spec_helper'

describe Chore do

  let(:house) { FactoryGirl.create(:house) }
  let(:chore) { FactoryGirl.build(:chore) }
  let(:user) { FactoryGirl.create(:user) }

  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :frequency }
    it { should belong_to :house }
  end

  describe "complete! method" do
    it { should respond_to(:complete!) }

    it "creates a new CompletedChore" do
      expect { chore.complete!(house.users.first, house) }.to change { CompletedChore.count }.by(1)
    end

    it "updates the due date of the chore" do
      expect { chore.complete!(house.users.first, house) }.to change { chore.due_date }
    end

    it "updates the last_completed field of the chore" do
      expect { chore.complete!(house.users.first, house) }.to change { chore.last_completed }
    end
  end

end
