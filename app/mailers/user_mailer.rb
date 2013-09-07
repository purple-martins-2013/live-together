class UserMailer < ActionMailer::Base
  default from: "livetogether@fabianuribe.com"

  def welcome_mail(user)
    @user = user
    @url = "http://live-together.herokuapp.com"
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end


  def invitation_email(invitation)
    @email = invitation.email
    @house = invitation.house
    @url = "http://live-together.herokuapp.com"
    mail(to: @email, subject: 'Someone invited you to join livetogether')
  end
end