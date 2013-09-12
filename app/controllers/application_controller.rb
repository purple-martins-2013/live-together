class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_house
    current_user.house
  end

  def to_cents(dollars)
    dollars * 100
  end

  def to_dollars(cents)
    cents.abs/100.0
  end


  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me, :house_id) }
  end
end
