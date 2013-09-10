Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['APP_ID'], ENV['SECRET_KEY'], :scope => 'email', display: 'popup'
end