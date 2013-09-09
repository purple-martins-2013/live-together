class Expense < ActiveRecord::Base
  validates_presence_of :name, :total_cents, :purchased_on

  has_many :settlements
  has_many :contributors, through: :settlements, class_name: "User"
  belongs_to :purchaser, class_name: "User"
end
