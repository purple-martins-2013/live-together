class GroceryList < ActiveRecord::Base

  belongs_to :house
  has_many :grocery_items
  has_and_belongs_to_many :users

  validates_presence_of :name

end