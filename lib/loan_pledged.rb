#require 'rubygems'
#require 'mongoid/railtie'
#
#
#
#connection = Mongo::Connection.new
#if Rails.env == "development"
#  connection = Mongo::Connection.new
#  Mongoid.database = connection.db("milaap_development")
#elsif Rails.env == "staging"
#  connection = Mongo::Connection.new
#  Mongoid.database = connection.db("milaap_staging")
#elsif Rails.env == "production"
#  connection = Mongo::Connection.new
#  Mongoid.database = connection.db("milaap_production")
#end
#
#
#class User
#  include Mongoid::Document
#  field :first_name, :type => String
#  field :last_name, :type => String
#  field :username, :type => String
#  field :facebook_uid,:type => String
#  field :facebook_token, :type => String
#  field :facebook_bio, :type => String
#  field :facebook_first_name, :type => String
#  field :facebook_last_name, :type => String
#  field :facebook_link, :type => String
#  field :facebook_location, :type => String
#  field :facebook_locale, :type => String
#  field :facebook_name, :type => String
#  field :twitter_uid, :type => String
#  field :twitter_name,:type => String
#  field :twitter_photo_url,:type => String
#  field :access_token,:type => String
#  field :secret, :type => String
#  field :twitter_followers_count, :type => Integer
#  field :twitter_screen_name, :type => String
#  field :twitter_profile_image_url, :type => String
#  field :twitter_location, :type => String
#  field :twitter_created_at, :type => String
#  field :twitter_lang, :type => String
#  field :twitter_url, :type => Integer
#  field :twitter_friends_count, :type => Integer
#  field :twitter_description, :type => String
#  field :twitter_time_zone, :type => String
#  field :twitter_uid, :type => Integer
#  field :twitter_name,:type => String
#  field :access_token,:type => String
#  field :secret, :type => String
#  field :invitation_flag, :type => Boolean, :default=> false
#  field :user_type, :type => String
#  field :user_country, :type => String
#  field :loan_pledged, :type => Boolean, :default=> false
#end
#
#@users = User.all
#
#unless @users.blank?
# @users.each do |user|
#   user.loan_pledged=false
#   user.save
#   p "*****************"
#   p user.loan_pledged
# end
#end
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
