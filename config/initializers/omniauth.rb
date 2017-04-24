OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'],  callback_url: 'http://localhost:3000/'
end
