# Load the Rails application.
require File.expand_path('../application', __FILE__)
# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SG_USER'],
  :password => ENV['SG_PASS'],
  :domain => 'wreet.co',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}


EDMUNDS_API_KEY = ENV['EDMUNDS_API_KEY']
