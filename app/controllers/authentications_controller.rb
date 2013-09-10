class AuthenticationsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]

    user = User.find_or_create_by_omniauth(auth)
    if user.persisted?
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, user)
    else
      flash[:error] = "Error while signing in account."
      redirect_to root_url
    end
  end
end
