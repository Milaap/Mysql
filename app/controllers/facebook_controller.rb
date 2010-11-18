class FacebookController < ApplicationController
  include Devise::Controllers::Helpers
  include DeviseOauth2Facebook::FacebookConsumerHelper
  def facebook_login
    url = facebook_call_url #send("user_fb_callback_url".to_sym)
    redirect_to facebook_client.authorization.authorize_url(:redirect_uri => url , :scope => Devise.facebook_permissions)
  end 
   
	def facebook_call
		url =  facebook_call_url
		client = facebook_client
		client.authorization.process_callback(params[:code], :redirect_uri => url)
		token = client.access_token
		fb_user = client.selection.me.info!
		Rails.logger.info "FB USER:"
		Rails.logger.info fb_user.inspect		
		user = User.find_with_facebook_user(fb_user, token)
		if user.blank?
			user= User.create_with_facebook_user(fb_user, token)
			MilaapMailer.welcome_email(user).deliver
			find_geo_location
			user.user_country = $visiting_user_country
			user.save
			sign_in(User, user)
			redirect_to welcome_url
		else	
			find_geo_location
			user.user_country = $visiting_user_country
			user.save
			sign_in(User, user)
			redirect_to welcome_url
		end
	end
end


   #Fetch client (Remote IP address) and remember using cookie
   #Set cookie expired default= x days
    #TODO if IPtocountry service (http://ipinfodb.com/ip_query_country.php) in error refer local IP database; require application to interact with multiple database
   
     #if User.respond_to?(:serialize_into_cookie)
      #user.remember_me!
      #cookies.signed["remember_user_token"] = {
       #:value => user.class.serialize_into_cookie(user),
       #:expires => user.remember_expires_at,
       #:path => "pledge_url"
     # }
    #end
    #set_flash_message :notice, :signed_in
    #flash[:notice] = "sign in successfully"
   
    
    
    
    
    
    
   # if user.loan_pledged == true
      # @pledge = PledgeInfo.first(:conditions => {:email =>user.email})
       #@cat =  Category.first(:conditions => {:category_id =>@pledge.category_id})
       #session[:pledged] = true   
       #flash[:notice] = "Hi, Looks like you pledged a loan for #{@cat.name.titleize} during your last visit.why not make a loan today?"
       #redirect_to view_all_projects_path  
    #else
	#session[:pledged] = nil  
	#redirect_to pledge_url      
   # end



    #redirect_to thank_you_url
