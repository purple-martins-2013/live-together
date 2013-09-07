require 'spec_helper'

describe CompletedChore do
  describe "associations" do
    it { should belong_to :chore }
    it { should belong_to :user }
  end
end
