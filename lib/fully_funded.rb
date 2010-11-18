#require 'rubygems'
#require 'mongoid/railtie'
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
#class Loan
#  include Mongoid::Document
#  include Mongoid::Timestamps
#
#  field :id,:type => Integer
#  field :category_id, :type => Integer
#  field :category, :type => String
#  field :date_listed, :type => DateTime
#  field :expiry_date, :type => DateTime
#  field :title, :type => String
#  field :info, :type => String
#  field :amount, :type => Float
#  field :terms, :type => Integer
#  field :amount_funded, :type => Float,:default => 0.0
#  field :amount_remaining, :type => Float,:default => 0.0
#  field :repayment_cycle, :type => String
#  field :date_of_disbursement_of_loan, :type => DateTime
#  field :date_of_final_payment, :type => DateTime
#  field :amount_repaid, :type => Float,:default => 0.0
#  field :loan_status, :type => String
#  field :interest_rate, :type => Float
#  field :field_partner_id, :type => Integer
#  field :field_partner_name, :type => String
#  field :social_impact, :type => String
#  field :loan_impact_story, :type => String
#  field :loan_funded_percentage, :type => Float,:default => 0.0
#  field :loan_amount_in_dollar, :type => Float,:default => 0.0
#  field :loan_amount_remaining_in_dollar, :type => Float,:default => 0.0
#
#  @current_dollar_rate = 45
#  @loans = Loan.all(:conditions=>{:loan_status=>"Repaying"})
#
#  unless @loans.blank?
#   @loans.each do |loan|
#    loan.loan_amount_in_dollar = (loan.amount/45).round()
#    loan.amount_remaining = 0
#    loan.loan_amount_remaining_in_rupees=0
#    loan.save
#     p "***************"
#     p loan.loan_id
#     p loan.amount_remaining
#     p loan.loan_amount_in_dollar.round()
#     p loan.loan_amount_remaining_in_rupees
#     p "***************"
#   end
#  end
#
#
#
#
#end
