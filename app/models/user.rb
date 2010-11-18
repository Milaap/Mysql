require 'rubygems'
require 'digest/sha1'
require 'RMagick'


class User < ActiveRecord::Base
  #include Magick
  #include Devise::Controllers::Helpers

 # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable

 devise  :authenticatable,
         :token_authenticatable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :oauthable,
         :token_authenticatable,
         :lockable,
         :timeoutable,
         :confirmable,
         :devise_oauth2_facebook
         #:oauth2_authenticatable

  has_one  :lender


 #validates :first_name, :presence => true
 #validates :last_name, :presence => true

 #validates_length_of :password, :minimum => 6, :maximum => 20

 attr_accessible :email, :password, :password_confirmation,:twitter_followers_count,:twitter_screen_name,
                        :twitter_profile_image_url,
                        :twitter_location,
                        :twitter_created_at,
                        :twitter_lang,
                        :twitters_blog_url,
                        :twitter_friends_count,
                        :twitter_description,
                        :twitter_time_zone,
                        :twitter_uid,
                        :twitter_name,
                        :access_token,
                        :secret
	#IMAGE_TYPES = ['image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png','image/png']


	def self.save_picture(userimg=nil, userId=nil)
    if !userimg.nil? and userId != ""
      #content_type = userimg.content_type.strip

      #if IMAGE_TYPES.include?(content_type)
        @filename = userimg.strip
				#self.sanitize_filename(content_type)
        #@imgname = "new_user_#{userId}.jpg"
        File.open("#{Rails.root}" + "/public/images/user_default"+"/#{@filename}", "wb"){ |f| f.write(userimg.read) }
				#= Magick::Image.read("/home/local/BETTER/margesh/Milaap/22oct/public/images/borrower/#{borrower.photo}").first

        maxwidth    = 145
        maxheight   = 140


        aspectratio = maxwidth.to_f / maxheight.to_f
        aspectratio1 = maxwidth1.to_f / maxheight1.to_f

        pic = Magick::Image.read("#{Rails.root}" + "/public/images/user_default" + "/#{@filename}").first
        imgwidth = pic.columns
        imgheight = pic.rows
        imgratio = imgwidth.to_f / imgheight.to_f

        imgratio > aspectratio ? scaleratio = maxwidth.to_f / imgwidth : scaleratio = maxheight.to_f / imgheight
        tiny = pic.resize(scaleratio)
        nameLarge = "#{Rails.root}" + "/public/images/user"+"/profile_image#{userId}.jpg"
        tiny.write(nameLarge)

        return "image#{userId}.jpg"
      #end
    end
  end




 def update_facebook_user(fb_user)
   self.email = fb_user.email.to_s.downcase if fb_user.email.present?
   self.facebook_bio  = fb_user.bio.to_s.downcase if fb_user.bio.present?
   self.first_name  = fb_user.first_name.to_s.downcase if fb_user.first_name.present?
   self.last_name  = fb_user.last_name.to_s.downcase if fb_user.last_name.present?
   self.facebook_first_name  = fb_user.first_name.to_s.downcase if fb_user.first_name.present?
   self.facebook_last_name  = fb_user.last_name.to_s.downcase if fb_user.last_name.present?
   self.facebook_link  = fb_user.link.to_s.downcase if fb_user.link.present?
   self.facebook_location  = fb_user.location.to_s.downcase if fb_user.location.present?
   self.facebook_locale  = fb_user.locale.to_s.downcase if fb_user.locale.present?
   self.facebook_name  = fb_user.name.to_s.downcase if fb_user.name.present?
 end

 def self.find_loan_lender(lender_id)
    @lender = self.first(:conditions=>{:id=>lender_id})
    p "*************"
    p @lender.inspect
    p @lender.class
    p "*************"
    return @lender
 end

	public
  def self.sanitize_filename(filename)
    filename = File.basename(filename.gsub("\\", "/"))
    filename.gsub!(/[^a-zA-Z0-9\.\-\+_]/,"_")
    filename = "_#{filename}" if filename =~ /^\.+$/
    filename = "unnamed" if filename.size == 0
    filename
  end


end
