if Rails.env.development?
  Rails.application.config.action_mailer.delivery_method = :smtp
  Rails.application.config.action_mailer.smtp_settings = {
  :address => "127.0.0.1",
  :port => 1025
}
end

if Rails.env.production?
  Rails.application.config.action_mailer.delivery_method = :smtp
  Rails.application.config.action_mailer.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => "peterrko1004@gmail.com",
    :password  => "OqBNJ7bhZNHqhAqz2ZYV0w", # SMTP password is any valid API key
    :authentication => 'login', # Mandrill supports 'plain' or 'login'
    :domain => 'https://immense-oasis-2395.herokuapp.com/', # your domain to identify your server when connecting
  }
end
