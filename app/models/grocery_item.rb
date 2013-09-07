class GroceryItem < ActiveRecord::Base

  belongs_to :grocery_list

  validates_presence_of :name

end