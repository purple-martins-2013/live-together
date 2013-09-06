class Invitation < ActiveRecord::Base
  validates_presence_of :email
  
  belongs_to :house
end
