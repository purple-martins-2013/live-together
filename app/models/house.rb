class House < ActiveRecord::Base

  has_many :users
  has_many :chores
  has_many :grocery_lists
  has_many :invitations

  validates_presence_of :name, :address

end