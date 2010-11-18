class AddFieldToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :facebook_uid, :string
    add_column :users, :facebook_token, :string
    add_column :users, :facebook_link, :string
    add_column :users, :facebook_locale, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :user_country, :string
    add_column :users, :user_type, :string
    add_column :users, :facebook_bio, :string
    add_column :users, :facebook_first_name, :string
    add_column :users, :facebook_last_name, :string
    add_column :users, :facebook_location, :string
    add_column :users, :facebook_name, :string
    add_column :users, :image_url, :string
    add_column :users, :intro, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :invitation_flag, :boolean, :default => false
    add_column :users, :loan_pledged, :boolean, :default => false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_column :users, :twitter_uid, :string
    add_column :users, :twitter_name, :string
    add_column :users, :twitter_photo_url, :string
    add_column :users, :access_token, :string
    add_column :users, :secret, :string
    add_column :users, :twitter_screen_name, :string
    add_column :users, :twitter_profile_image_url, :string
    add_column :users, :twitter_location, :string
    add_column :users, :twitter_lang, :string
    add_column :users, :twitter_url, :string
    add_column :users, :twitter_friends_count, :string
    add_column :users, :twitter_description, :string
    add_column :users, :twitter_time_zone, :string

  end

  def self.down
#      remove_column :users, :facebook_uid
#      remove_column :users, :facebook_token
#      remove_column :users, :facebook_link
#      remove_column :users, :confirmed_at
#      remove_column :users, :user_country
#      remove_column :users, :user_type
#      remove_column :users, :facebook_bio
#      remove_column :users, :facebook_first_name
#      remove_column :users, :facebook_last_name
#      remove_column :users, :facebook_location
#      remove_column :users, :facebook_name
#      remove_column :users, :image_url
#      remove_column :users, :intro
#      remove_column :users, :country
#      remove_column :users, :city
#      remove_column :users, :invitation_flag
#      remove_column :users, :loan_pledged
#
#      remove_column :users, :twitter_uid
#      remove_column :users, :twitter_name
#      remove_column :users, :twitter_photo_url
#      remove_column :users, :access_token
#      remove_column :users, :secret
#      remove_column :users, :twitter_screen_name
#      remove_column :users, :twitter_profile_image_url
#      remove_column :users, :twitter_location
#      remove_column :users, :twitter_lang
#      remove_column :users, :twitter_url
#      remove_column :users, :twitter_friends_count
#      remove_column :users, :twitter_description
#      remove_column :users, :twitter_time_zone
#      remove_column :users, :facebook_locale
      remove_column :users, :first_name
      remove_column :users, :last_name

  end
end
