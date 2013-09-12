class Expense < ActiveRecord::Base
  attr_accessor :contributor_ids
  validates_presence_of :purchaser_id, :name, :total_cents, :purchased_on

  has_many :debts, :dependent => :delete_all
  has_many :borrowers, through: :debts, class_name: "User"
  belongs_to :purchaser, class_name: "User"

  after_save :create_debts
  # monetize :total_cents

  private
  def create_debts
    contributors = User.where :id => self.contributor_ids
    contributors << self.purchaser
    # we account for the user that created the expense (self.purchaser) so we add 1 to the count of total contributors.
    debt_amount = self.total_cents/contributors.size
    contributors.each do |user|
      self.debts.create(borrower: user, lender: self.purchaser , amount_cents: debt_amount)
    end
  end
end
