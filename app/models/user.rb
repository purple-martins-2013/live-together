require 'securerandom'

class User < ActiveRecord::Base

  belongs_to :house
  has_and_belongs_to_many :grocery_lists
  has_many :invitations
  has_many :authentications, dependent: :delete_all
  has_many :expenses, foreign_key: :purchaser_id
  has_many :debts, foreign_key: :borrower_id
  has_many :payments, foreign_key: :borrower_id
  has_many :completed_chores

  validates_presence_of :email, :name

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.find_or_create_by_omniauth(auth)
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
    return authentication.user if authentication

    user = User.new
    user.password = Devise.friendly_token[0,20]
    user.email = auth['info']['email']
    user.name = auth['info']['name']
    user.image = auth['info']['image']
    user.save
    user.authentications.create(provider: auth['provider'], uid: auth['uid'], token: auth['credentials']['token'])
    user
  end

end
