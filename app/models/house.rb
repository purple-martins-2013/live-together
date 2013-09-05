class House < ActiveRecord::Base

  validates_presence_of :name, :address

  has_many :users
  has_many :chores

end