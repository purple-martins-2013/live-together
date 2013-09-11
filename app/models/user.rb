class User < ActiveRecord::Base

  belongs_to :house
  has_and_belongs_to_many :grocery_lists
  has_many :invitations
  has_many :expenses, foreign_key: :purchaser_id
  has_many :debts, foreign_key: :borrower_id
  has_many :payments, foreign_key: :borrower_id
  has_many :completed_chores

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
