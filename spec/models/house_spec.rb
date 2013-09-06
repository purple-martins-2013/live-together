require 'spec_helper'

describe House do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should have_many :users }
    it { should have_many :chores }
    it { should have_many :grocery_lists }
  end
end