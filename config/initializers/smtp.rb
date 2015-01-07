#if Rails.env.development?
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.zoho.com",
  :port                 => 465,
  :user_name            => 'countries_launch_academy@zoho.com',
  :password             => 'MakeNoBugs!',
  :authentication       => :login,
  :ssl                  => true,
  :tls                  => true,
  :enable_starttls_auto => true
}
#end
