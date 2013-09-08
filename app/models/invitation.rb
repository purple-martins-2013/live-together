class Invitation < ActiveRecord::Base
  belongs_to :house
  belongs_to :user

  validates_presence_of :email, :user, :house
end
