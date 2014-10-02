OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '782258585130216', '77d17aaedcb86d0237ba8e8559f5062a'
end