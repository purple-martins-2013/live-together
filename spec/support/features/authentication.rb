def sign_up_through_view(user)
  visit new_user_registration_path
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: user.password
  fill_in 'user_password_confirmation', with: user.password
  click_button 'Sign up'
end

def sign_in_through_view(user)
  visit new_user_session_path
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: user.password
  click_button 'Sign in'
end

def sign_out_through_view
  click_link "Logout"
end