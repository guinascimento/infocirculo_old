require 'smtp_tls'

# Email settings
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "infocirculo.com.br",
  :authentication => :login,
  :user_name => "javaplayer@gmail.com",
  :password => "guimelxxaut185ttye"  
}