ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => "mail.authsmtp.com",
    :port => 25,
    :domain => "mail.authsmtp.com",
    :user_name => "ac52051",
    :password => "gbtmcyy2hutgwp",
    :authentication => :login
   } 
