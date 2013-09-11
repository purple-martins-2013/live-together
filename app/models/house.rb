class House < ActiveRecord::Base

  has_many :users
  has_many :chores
  has_many :completed_chores
  has_many :grocery_lists

  validates_presence_of :name, :address
end