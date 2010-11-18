Millap::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb
  config.action_mailer.default_url_options = { :host => 'localhost:8080' }
  PAYPAL_PATH="https://www.sandbox.paypal.com/cgi-bin/webscr/"
  HOST_PATH = "http://localhost:8080"
  PAYPAL_BUSINESS = "marges_1282803924_biz@betterlabs.net"
  PAYPAL_USER ="marges_1282803924_biz_api2.betterlabs.net"
  PAYPAL_PWD = "V6MTPE52ER59E7DF"
  PAYPAL_SIGNATURE = "AArGuq-Zw1AqzZhu9hTPQUKIZYzVAb57.gRtjmARHsa60hbJfKviRqN2" 

  


  # Facebook setting 
  


  



  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log
end
