class Settlement < ActiveRecord::Base
  validates_presence_of :amount_cents, :date_paid

  belongs_to :contributor, class_name: "User"
  belongs_to :expense

  monetize :amount_cents

  def pay!
    self.update_attributes(date_paid: Date.today)
  end

  # def amount_in_cents
  #   amount.fractional
  # end

end

