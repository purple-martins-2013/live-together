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
    p auth['info']
    if user.save
      user.authentications.create(provider: auth['provider'], uid: auth['uid'], token: auth['credentials']['token'])
    else
      p user.errors.full_messages
    end
    user
  end

  def roomates
    User.where(house: self.house).where.not(id: self.id)
  end

  def settlements
    self.roomates.map do |roomate|
      {roomate: roomate, balance: debt_with(roomate)}
    end
  end

  def debt_with(roomate)
    debts = Debt.where(borrower: self, lender: roomate).sum(:amount_cents)
    loans = Debt.where(borrower: roomate, lender: self).sum(:amount_cents)
    payments_sent = Payment.where(borrower: self, lender: roomate).sum(:amount_cents)
    payments_received = Payment.where(borrower: roomate, lender: self).sum(:amount_cents)
    return loans - debts + payments_sent - payments_received
  end

end
