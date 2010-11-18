# This file is auto-generated from the current state of the database. Instead 
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your 
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101117095115) do

  create_table "borrower_groups", :id => false, :force => true do |t|
    t.integer  "loan_id"
    t.integer  "field_partner_id"
    t.integer  "borrower_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "borrowers", :force => true do |t|
    t.string   "country"
    t.string   "name"
    t.string   "gender"
    t.string   "photo"
    t.string   "village"
    t.string   "taluka"
    t.string   "district"
    t.string   "state"
    t.integer  "loan_id"
    t.integer  "borrower_group_id"
    t.integer  "field_partner_id"
    t.text     "borrower_story"
    t.integer  "community_id"
    t.integer  "poverty_level"
    t.string   "impact_story_image"
    t.integer  "lender_id"
    t.integer  "age"
    t.string   "profile_image"
    t.string   "home_image"
    t.string   "search_image"
    t.string   "education"
    t.integer  "avg_monthly_income"
    t.string   "occupation"
    t.string   "credit_rating"
    t.string   "name_of_student"
    t.string   "relationship_with_applicant"
    t.string   "SHG"
    t.string   "purpose"
    t.datetime "date_disbursed"
    t.date     "date_of_final_payment"
    t.float    "interest_rate"
    t.float    "loan_amount"
    t.integer  "term"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.string   "category_logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "communities", :force => true do |t|
    t.text     "info"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dealings", :force => true do |t|
    t.integer  "borrower_group_id"
    t.integer  "loan_id"
    t.integer  "borrower_id"
    t.integer  "lender_id"
    t.integer  "user_id"
    t.string   "payment_status"
    t.string   "transaction_type"
    t.integer  "transaction_id"
    t.integer  "current_credit"
    t.integer  "transaction_amount"
    t.integer  "net_to_milaap"
    t.string   "payer_name"
    t.string   "payer_email"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_infos", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "field_partners", :force => true do |t|
    t.integer  "community_id"
    t.string   "info"
    t.integer  "field_partner_id"
    t.string   "name"
    t.integer  "yrs_of_existance"
    t.integer  "lending_rate"
    t.integer  "repayment_rate"
    t.integer  "deliquency_rate"
    t.integer  "credit_rating"
    t.string   "information"
    t.string   "logo"
    t.string   "url"
    t.string   "field_partner_type"
    t.string   "total_loan_portfolio"
    t.string   "rating_agency"
    t.integer  "total_no_of_borrowers"
    t.string   "no_of_SHGS"
    t.string   "no_of_villages"
    t.integer  "no_of_districts_operating"
    t.integer  "no_of_poorest_districts"
    t.float    "percentage_of_women_borrowers"
    t.float    "percentage_rural"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", :force => true do |t|
    t.string   "recipent_email"
    t.datetime "sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sender"
    t.string   "invitation_token"
    t.string   "invitation_confirm"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lenders", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.string   "photo"
    t.string   "karma_points"
    t.string   "user_referred_to"
    t.integer  "total_amount_loaned"
    t.integer  "total_amount_repaid"
    t.integer  "total_amount_cashed_out"
    t.integer  "milaap_credits"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_lenders", :force => true do |t|
    t.integer  "lender_id"
    t.float    "amount"
    t.string   "lender_email"
    t.integer  "transaction_id"
    t.integer  "loan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loan_repayments", :force => true do |t|
    t.integer  "loan_id"
    t.datetime "repayment_date"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.integer  "amount_funded"
    t.integer  "amount_remaining"
    t.integer  "amount_repaid"
    t.float    "loan_funded_percentage"
    t.string   "title"
    t.string   "info"
    t.integer  "category_id"
    t.datetime "date_listed"
    t.datetime "expiry_date"
    t.datetime "date_of_disbursement_of_loan"
    t.integer  "amount"
    t.string   "terms"
    t.string   "repayment_cycle"
    t.string   "loan_status"
    t.float    "interest_rate"
    t.string   "field_partner_name"
    t.string   "social_impact"
    t.text     "social_impact_story"
    t.integer  "field_partner_id"
    t.float    "loan_amount_in_dollar"
    t.string   "loan_impact_story"
    t.float    "loan_amount_remaining_in_dollar"
    t.float    "loan_amount_in_rupees"
    t.float    "loan_amount_remaining_in_rupees"
    t.float    "date_of_final_payment"
    t.string   "purpose"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milaap_balances", :force => true do |t|
    t.float    "balance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pledge_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.integer  "category_id"
    t.float    "amount"
    t.string   "currenecy_type"
    t.string   "period_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                    :default => "",    :null => false
    t.string   "encrypted_password",        :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                            :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                            :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_uid"
    t.string   "facebook_token"
    t.string   "facebook_link"
    t.string   "facebook_locale"
    t.datetime "confirmed_at"
    t.string   "user_country"
    t.string   "user_type"
    t.string   "facebook_bio"
    t.string   "facebook_first_name"
    t.string   "facebook_last_name"
    t.string   "facebook_location"
    t.string   "facebook_name"
    t.string   "image_url"
    t.string   "intro"
    t.string   "country"
    t.string   "city"
    t.boolean  "invitation_flag",                          :default => false
    t.boolean  "loan_pledged",                             :default => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "twitter_uid"
    t.string   "twitter_name"
    t.string   "twitter_photo_url"
    t.string   "access_token"
    t.string   "secret"
    t.string   "twitter_screen_name"
    t.string   "twitter_profile_image_url"
    t.string   "twitter_location"
    t.string   "twitter_lang"
    t.string   "twitter_url"
    t.string   "twitter_friends_count"
    t.string   "twitter_description"
    t.string   "twitter_time_zone"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
