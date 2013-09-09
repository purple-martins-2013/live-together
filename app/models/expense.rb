class Expense < ActiveRecord::Base
  validates_presence_of :name, :total_cents, :purchased_on

  belongs_to :user
end
