class Settlement < ActiveRecord::Base
  validates_presence_of :amount_cents, :date_paid

  belongs_to :user
  belongs_to :grocery_list
  belongs_to :expense

end

