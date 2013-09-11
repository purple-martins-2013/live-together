class Expense < ActiveRecord::Base
  attr_accessor :contributor_ids
  validates_presence_of :purchaser_id, :name, :total_cents, :purchased_on

  has_many :settlements
  has_many :contributors, through: :settlements, class_name: "User"
  belongs_to :purchaser, class_name: "User"

  after_save :create_settlements
  # monetize :total_cents

#using gem I wasn't sure if this is needed.
  # def amount_in_cents
  #   amount.fractional
  # end

# expense.users.count needs to be updated.
  # def shared_amount_cents
  #   total_cents / expense.users.count
  # end

  private
  def create_settlements
    contributors = User.where :id => self.contributor_ids
    # we account for the user that created the expense (self.purchaser) so we add 1 to the count of total contributors.
    amount = self.total_cents/(contributors.count+1)
    contributors.each do |user|
      self.settlements.create :contributor => user, :amount => amount
    end
  end
end
