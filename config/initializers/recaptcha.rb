Recaptcha.configure do |config|
  config.site_key = Rails.application.credentials.config[:recaptcha][:RECAPTCHA_SITE_KEY]
  config.secret_key = Rails.application.credentials.config[:recaptcha][:RECAPTCHA_SECRET_KEY]
end
