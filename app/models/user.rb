class User < ActiveRecord::Base

  belongs_to :house
  has_and_belongs_to_many :grocery_lists
  has_many :invitations
  has_many :expenses, foreign_key: :purchaser_id
  has_many :settlements, foreign_key: :contributor_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
