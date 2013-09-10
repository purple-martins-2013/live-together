class Authentication < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user, :provider, :uid, :token
end
