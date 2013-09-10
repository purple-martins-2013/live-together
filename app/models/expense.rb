class Expense < ActiveRecord::Base
  validates_presence_of :name, :total_cents, :purchased_on

  has_many :settlements
  has_many :contributors, through: :settlements, class_name: "User"
  belongs_to :purchaser, class_name: "User"

  monetize :total_cents

#using gem I wasn't sure if this is needed.
  # def amount_in_cents
  #   amount.fractional
  # end

# expense.users.count needs to be updated.
  # def shared_amount_cents
  #   total_cents / expense.users.count
  # end

end
