#require 'net/https'
#require 'uri'
#require 'hpricot'
class ApplicationController < ActionController::Base

  #before_filter :authenticate_user!
 #  protect_from_forgery
  def  find_geo_location
#		begin
#			if cookies[:visiting_user_country].blank?
#				geo_location = GeoIp.geolocation("#{request.remote_ip}")
#				@country =  geo_location[:country_name]
#				unless @country.blank?
#					if @country == "Reserved"
						$visiting_user_country = "India" 
#					else
#						$visiting_user_country = @country
#					end
#				end
#				cookies[:visiting_user_country] = {
#					:value => $visiting_user_country ,
#					:expires => 30.days.from_now.utc
#				}
#			else
#				geo_location = GeoIp.geolocation("#{request.remote_ip}")
#				@country =  geo_location[:country_name]
#				unless @country.blank?
#					if @country == "Reserved"
#						$visiting_user_country = "India"
#					else
#						$visiting_user_country = @country
#					end
#				end
#				if  $visiting_user_country !=  cookies[:visiting_user_country]
#					cookies[:visiting_user_country] = {
#						:value => $visiting_user_country ,
#						:expires => 30.days.from_now.utc
#					}
#				end
#			end
#		rescue
#      $visiting_user_country = "United states"
#		end
	end

 def check_invitation_code
  return if session[:correct_invitation_token]
  flash[:notice]="Please enter the invitation token to access the pages."
  redirect_to verify_invitation_code_path
 end

def check_loan_pledged
  return if session[:pledged]
  redirect_to pledge_url
 end

 #def check_invitation_code
    #return if session[:correct_invitation_token]
  #  if user_signed_in?
   #   if current_user.invitation_flag == true
        # session[:correct_invitation_token] = true
    #  else
     #   session[:correct_invitation_token] = nil
     # end  
    #else  
     #flash[:notice]="Please enter the invitation token to access the pages."
     #redirect_to verify_invitation_code_path
    #end
 #end


  def after_sign_in_path_for(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    home_path = :"root_path"
    respond_to?(home_path, true) ? send(home_path) : root_path
 end
 
	def sign_in_and_redirect(resource_or_scope, *args)
		options  = args.extract_options!
		scope    = Devise::Mapping.find_scope!(resource_or_scope)
		resource = args.last || resource_or_scope
		sign_in(scope, resource, options) unless warden.user(scope) == resource
		find_geo_location 
		resource.user_country = $visiting_user_country
		resource.save   
		redirect_to welcome_url
	end

  def redirect_for_sign_out(scope) 
    session[:pledged] = nil	  
    redirect_to root_path
 end


end

