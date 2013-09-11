class Debt < ActiveRecord::Base

  validates_presence_of :borrower, :lender, :expense, :amount_cents

  belongs_to :borrower, class_name: "User"
  belongs_to :lender, class_name: "User"
  belongs_to :expense

end