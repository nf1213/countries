# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.server_settings = {
    :address        => 'smtp.gmail.com',
    :domain         => 'gmail.com',
    :port           => 587,
    :user_name      => 'peterrko1004@gmail.com',
    :password       => 'koko67250',
    :authentication => :plain
}
ActionMailer::Base.raise_delivery_errors = true
