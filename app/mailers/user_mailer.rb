class UserMailer < ActionMailer::Base
  default from: "livetogether@fabianuribe.com"

  def welcome_email(user)
    @user = user
    @url = "http://live-together.herokuapp.com"
    mail(to: @user.email, subject: 'Welcome to Live-Together')
  end

  def invitation_email(invitation)
    @email = invitation.email
    @user = invitation.user
    @house = invitation.user.house
    @url = "http://live-together.herokuapp.com"
    mail(to: @email, subject: 'Someone invited you to join Live-Together')
  end

  def payment_request_email(lender, borrower)
    @lender = lender
    @borrower = borrower
    @balance =  "%.2f" % (lender.debt_with(borrower)/100.0)
    @url = "http://live-together.herokuapp.com"
    mail(to: @borrower.email, subject: 'Roomate request')
  end
end
