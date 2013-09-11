class Payment < ActiveRecord::Base
  validates_presence_of :borrower, :lender, :description, :amount_cents

  belongs_to :borrower, class_name: "User"
  belongs_to :lender, class_name: "User"

end
