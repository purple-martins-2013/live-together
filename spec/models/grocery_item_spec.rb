require 'spec_helper'

describe GroceryItem do

  describe "validations" do
    it {should validate_presence_of :name }
    it {should validate_presence_of :grocery_list_id }
    it {should belong_to :grocery_list }
  end
end
