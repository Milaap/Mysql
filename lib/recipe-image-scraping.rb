#require 'rubygems'
#require 'mongoid/railtie'
#require 'digest/sha1'
#require 'RMagick'
#
#
#
#connection = Mongo::Connection.new
#
# if Rails.env == "development"
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
#class Borrower
#  include Magick
#  include Mongoid::Document
#  include Mongoid::Timestamps
#
#  field :id, :type => Integer
#  field :id, :type => Integer
#  field :id, :type => Integer
#  field :lender_id, :type => Integer
#  field :field_partner_id, :type => Integer
#  field :name, :type => String
#  field :gender, :type => String
#  field :age, :type => Integer
#  field :photo, :type => String
#  field :profile_image, :type => String
#  field :home_image, :type => String
#  field :search_image, :type => String
#  field :village, :type => String
#  field :taluka, :type => String
#  field :district, :type => String
#  field :state, :type => String
#  field :country, :type => String,:default=>"INDIA"
#  field :id, :type => String
#  field :education, :type => String
#  field :avg_monthly_income, :type => Float
#  field :occupation, :type => String
#  field :borrower_story, :type => String
#  field :poverty_level, :type => Float
#  field :credit_rating, :type => String
#
#  p "=============================="
#
#  @borrowers = Borrower.all
#  unless @borrowers.blank?
#    @borrowers.each do |borrower|
#
#
#      p  "==eee====================="
#      if borrower.photo.blank?
#        borrower.update_attributes(:photo=>"noimage.png")
#        borrower.update_attributes(:profile_image=>nil)
#        borrower.update_attributes(:search_image=>nil)
#        borrower.update_attributes(:home_image=>nil)
#        p "================if loop========================="
#      else
#        if borrower.loan_id ==  11
#	  borrower.update_attributes(:profile_image=>"indubai-innerpg.jpg")
#          borrower.update_attributes(:search_image=>"indubai-innerpg.jpg")
#	  borrower.update_attributes(:home_image=>"indubhai-homepg.jpg")
#        elsif borrower.loan_id ==  13
#	 borrower.update_attributes(:profile_image=>"chandralekha-innerpg.jpg")
#         borrower.update_attributes(:search_image=>"chandralekha-innerpg.jpg")
#	 borrower.update_attributes(:home_image=>"chandralekha-homepg.jpg")
#        else
#
#        #begin
#        maxwidth    = 225
#        maxheight   = 201
#        maxwidth1    = 191
#        maxheight1   = 185
#        maxwidth2    = 250
#        maxheight2   = 190
#
#
#
#        aspectratio = maxwidth.to_f / maxheight.to_f
#        aspectratio1 = maxwidth1.to_f / maxheight1.to_f
#        aspectratio2 = maxwidth2.to_f / maxheight2.to_f
#
#        pic = Magick::Image.read("#{Rails.root}/public/images/borrower/#{borrower.photo}").first
#        imgwidth = pic.columns
#        imgheight = pic.rows
#        imgratio = imgwidth.to_f / imgheight.to_f
#
#        imgratio > aspectratio ? scaleratio = maxwidth.to_f / imgwidth : scaleratio = maxheight.to_f / imgheight
#        tiny = pic.resize(scaleratio)
#        nameProfile = "#{Rails.root}/public/images/borrower/#{borrower.photo}"
#        tiny.write(nameProfile)
#
#        imgratio > aspectratio1 ? scaleratio = maxwidth1.to_f / imgwidth : scaleratio = maxheight1.to_f / imgheight
#        tiny = pic.resize(scaleratio)
#        nameSearch = "#{Rails.root}/public/images/borrower/search_image#{borrower._id}.jpg"
#        tiny.write(nameSearch)
#
#
#
#        imgratio > aspectratio1 ? scaleratio = maxwidth2.to_f / imgwidth : scaleratio = maxheight2.to_f / imgheight
#        tiny = pic.resize(scaleratio)
#        nameHome = "#{Rails.root}/public/images/borrower/home_image#{borrower._id}.jpg"
#        tiny.write(nameHome)
#
#
#        borrower.update_attributes(:profile_image=>"profile_image#{borrower._id}.jpg")
#        borrower.update_attributes(:search_image=>"search_image#{borrower._id}.jpg")
#        borrower.update_attributes(:home_image=>"home_image#{borrower._id}.jpg")
#        end
#        p "================Else loop========================="
#      #rescue
#      #end
#    end
#
#
#    end
#  end
#
#end
