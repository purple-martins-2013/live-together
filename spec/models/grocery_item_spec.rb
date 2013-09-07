require 'spec_helper'

describe GroceryItem do

  describe "validations" do
    it {should validate_presence_of :name }
    it {should belong_to :grocery_list }
  end
end