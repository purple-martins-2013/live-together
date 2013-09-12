class Payment < ActiveRecord::Base
  validates_presence_of :borrower, :lender, :description, :amount_cents, :method, :date

  belongs_to :borrower, class_name: "User"
  belongs_to :lender, class_name: "User"

  monetize :amount_cents

end
