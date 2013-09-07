class User < ActiveRecord::Base

  belongs_to :house
  has_and_belongs_to_many :grocery_lists

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
