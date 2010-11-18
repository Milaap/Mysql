class TwittOauthController < ApplicationController
 def twitter_login
   twit_key
   request_token = @consumer.get_request_token :oauth_callback => twitter_callback_url
   session[:request_token]         = request_token.token
   session[:request_token_secret]  = request_token.secret                  
   redirect_to request_token.authorize_url
 end
 
 def twitter_callback
   twit_key
   @request_token = OAuth::RequestToken.new(@consumer, session[:request_token], session[:request_token_secret])
   @access_token = @consumer.get_access_token(@request_token, :oauth_verifier => params[:oauth_verifier])
   data = JSON.parse(@access_token.get("/account/verify_credentials.json").body)
   
   p">>>>>>>>>>>>>"
   p data["followers_count"]
   p data["screen_name"]
   p data["profile_image_url"]
   p data["location"]
   p data["screen_name"]
   p data["created_at"]
   p data["url"]
   p data["friends_count"]
   p data["description"]
   p data["time_zone"]
   p data["id"]
   p data["name"]
   p ">>>>>>>>>>>>>"
   token = @access_token.token
   secret = @access_token.secret
   create_with_twitter_user(token, secret, data) 
 end
 
 private 
 
  TWITTER_CONSUMER_KEY    = "OfHxEB5Dfp7lDSPRsHD4bg"
  TWITTER_CONSUMER_SECRET = "x9hRfxKtKOOYtpykf3b7hOPiqbiq8ZmnJlZtmAKALQ"

 def twit_key        
   @consumer = OAuth::Consumer.new(TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET,
      :site               => "https://api.twitter.com",
      :scheme             => :header,
      :http_method        => :post,
      :request_token_path => "/oauth/request_token",
      :access_token_path  => "/oauth/access_token",
      :authorize_path     => "/oauth/authorize") 
 end

 def create_with_twitter_user(token, secret, data)
     user = User.find_or_create_by(:twitter_uid => data["id"])
      # Sign in the user and redirect
      user.skip_confirmation! if user.respond_to?(:skip_confirmation!)
      user.update_attributes(:access_token => token, 
                                       :secret => secret,
                                       :twitter_followers_count => data["followers_count"],
                                       :twitter_screen_name => data["screen_name"],
                                       :twitter_profile_image_url => data["profile_image_url"],
                                       :twitter_location => data["location"],
                                       :twitter_created_at => data["screen_name"],
                                       :twitter_lang => data["created_at"],
                                       :twitters_blog_url => data["url"],
                                       :twitter_friends_count => data["friends_count"],
                                       :twitter_description => data["description"],
                                       :twitter_time_zone => data["time_zone"],
                                       :twitter_name => data["name"]
                                       )
      env['warden'].set_user(user)
      redirect_to thank_you_url
 end
end
