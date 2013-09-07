require 'spec_helper'

describe GroceryList do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should belong_to :house }
    it { should have_many :grocery_items }
    it { should have_and_belong_to_many :users }
  end
end