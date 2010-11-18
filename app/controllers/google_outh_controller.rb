class GoogleOuthController < ApplicationController
  def google_login
   begin
    #googlekey = 'staging.milaap.org'
    #google_scrt = "X1dTapoeahbwcuAYlN3yI51V"
    googlekey = 'milaap.org'
    google_scrt = "4mqWeKGBDLkWJfzsT3umFUHN"
    site_url = 'http://www.milaap.org/'
    hmac_sign = HMAC::SHA1.new(google_scrt)
    consumer = OAuth::Consumer.new(googlekey,google_scrt,{
       :site=>"https://www.google.com",
       :oauth_consumer_key => googlekey,
       :oauth_nonce=>random_string(40),
       :oauth_timestamp=>Time.now.to_i,
       :oauth_version=>"1.0",
       :oauth_signature_method=> "HMAC-SHA1",
       :oauth_signature=> "#{hmac_sign}",
       :request_token_path => "/accounts/OAuthGetRequestToken",
       :authorize_path => "/accounts/OAuthAuthorizeToken",
       :access_token_path => "/accounts/OAuthGetAccessToken"})  
       $google_request_token = consumer.get_request_token({:oauth_callback=>"#{google_callback_url}"},
                                                        :scope => "https://www.googleapis.com/auth/userinfo#email")
       redirect_to $google_request_token.authorize_url
    rescue
     redirect_to new_user_session_url  
    end
  end

	def google_callback
		@access_token = $google_request_token.get_access_token({ :oauth_verifier => params[:oauth_verifier] ,:oauth_token => params[:oauth_token]})
		body = JSON.parse(@access_token.get("https://www.googleapis.com/userinfo/email?alt=json").body)
		user = User.first(:conditions=>{:email=>body["data"]["email"]})
		unless user.blank?
			sign_in(User,user)
			find_geo_location
			user.user_country = $visiting_user_country
			user.save
		  redirect_to welcome_url
		else
			# Sign in the user and redirect
			user = User.create(:email => body["data"]["email"])
			user.skip_confirmation! if user.respond_to?(:skip_confirmation!)
			MilaapMailer.welcome_email(user).deliver  
			sign_in(User, user)
			find_geo_location
			user.user_country = $visiting_user_country
			user.save
		  redirect_to welcome_url
		end
	end

  private
  
  def random_string(len)
    'sdfsr12345sdfsr12345sdfsr12345sdfsr12345'
  end
end
