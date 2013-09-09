class Invitation < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :email, :user
end
