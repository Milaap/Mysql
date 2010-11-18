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
    user = User.first(:conditions=>{:twitter_uid => data["id"]})
    unless user.blank?
        sign_in(User, user)
        redirect_to thank_you_url
    else
      user = User.create( :twitter_uid => data["id"],
                          :access_token => token, 
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
        # Sign in the user and redirect
        user.skip_confirmation! if user.respond_to?(:skip_confirmation!)
        #MilaapMailer.welcome_email(user).deliver
	sign_in(User, user)
	url = "http://ipinfodb.com/ip_query_country.php?ip=#{request.remote_ip}"
	uri  = URI.parse url
	http = Net::HTTP.new uri.host, uri.port
	response = http.get(url)
	data =<<EOD
	"#{response.body}"
EOD
	doc = Hpricot::XML(data)
	@country = (doc/:CountryName).innerHTML
	unless @country.blank? 
	 if @country == "Reserved"
	   user.user_country = "India" 
	 else
	   user.user_country = @country
	 end	
	user.save
	end   
 

        if user.invitation_flag == true
         session[:correct_invitation_token] = true
         redirect_to alpha_home_url
        elsif user.invitation_flag == false
          session[:correct_invitation_token] = true
          redirect_to thank_you_url
        else 
          redirect_to  thank_you_url 
        end   
    end
  end
end
