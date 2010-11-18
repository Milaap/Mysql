class Loan < ActiveRecord::Base

#  embeds_many :borrower_groups
#  embeds_many :dealings
#  embeds_many :borrowers
#  embeds_many :lenders
#  embeds_one  :category
#  embeds_one  :field_partner
#  embeds_many :loan_repayments

#  field :loan_id,:type => Integer   
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
#  field :loan_amount_in_rupees, :type => Float,:default => 0.0
#  field :loan_amount_remaining_in_rupees, :type => Float,:default => 0.0


  def self.find_specific_loan(loan_id)
   @loan = self.first(:conditions => {:loan_id => loan_id})
   return @loan
  end
  
	def self.find_loan_drop_down_values(loan,visiting_user_country)
		@loan_drop_down_values = [] 
		if visiting_user_country == "India"
			if loan.loan_amount_remaining_in_rupees > 0.0
			  if loan.loan_amount_remaining_in_rupees > 10000
					@drop_down_value_breaker = loan.loan_amount_remaining_in_rupees/500
					1.upto(@drop_down_value_breaker) {|i|  @loan_drop_down_values << i*500 }    
					@loan_drop_down_values =  @loan_drop_down_values.uniq.sort 
					@loan_drop_down_values = 	@loan_drop_down_values.select {|v| v >= 2000 }
					
				elsif loan.loan_amount_remaining_in_rupees <= 10000  and loan.loan_amount_remaining_in_rupees > 5000
					@drop_down_value_breaker = loan.loan_amount_remaining_in_rupees/500
					unless @drop_down_value_breaker.blank?
						1.upto(@drop_down_value_breaker) {|i|  @loan_drop_down_values << i*500}
						@loan_drop_down_values =  @loan_drop_down_values.uniq.sort 
						@loan_drop_down_values = 	@loan_drop_down_values.select {|v| v >= 2000 }
					end
        elsif loan.loan_amount_remaining_in_rupees <= 5000 and loan.loan_amount_remaining_in_rupees >= 2000
					@drop_down_value_breaker = loan.loan_amount_remaining_in_rupees/500
					unless @drop_down_value_breaker.blank?
						1.upto(@drop_down_value_breaker) {|i|  @loan_drop_down_values << i*500}
						@loan_drop_down_values =  @loan_drop_down_values.uniq.sort
            @loan_drop_down_values = 	@loan_drop_down_values.select {|v| v >= 2000 }
					end 
        elsif loan.loan_amount_remaining_in_rupees < 2000
					@loan_drop_down_values << loan.loan_amount_remaining_in_rupees
					@loan_drop_down_values = @loan_drop_down_values.flatten
					  
        end					
			end
		else
			if loan.amount_remaining > 0.0
				if loan.amount_remaining > 1000
					@loan_drop_down_values = [50,100,150,200,250,300,350,400,450,500,600,700,800,900,1000]       
					@drop_down_value_1000_breaker = loan.amount_remaining/500
					1.upto(@drop_down_value_1000_breaker) {|i|  @loan_drop_down_values << i*500 }    
					@loan_drop_down_values =  @loan_drop_down_values.uniq.sort   
				elsif loan.amount_remaining <= 1000  and loan.amount_remaining > 500
					@loan_drop_down_values = [50,100,150,200,250,300,350,400,450,500] 
					@drop_down_value_100_breaker = loan.amount_remaining/100
					unless @drop_down_value_100_breaker.blank?
						1.upto(@drop_down_value_100_breaker) {|i|  @loan_drop_down_values << i*100}
						@loan_drop_down_values =  @loan_drop_down_values.uniq.sort 
					end    
				elsif loan.amount_remaining <= 500 and loan.amount_remaining > 100
					@loan_drop_down_values = [50,100] 
					@drop_down_value_50_breaker = loan.amount_remaining/50
					unless @drop_down_value_50_breaker.blank?
						1.upto(@drop_down_value_50_breaker) {|i|  @loan_drop_down_values << i*50}
						@loan_drop_down_values =  @loan_drop_down_values.uniq.sort 
					end     
				elsif loan.amount_remaining <=  100 and loan.amount_remaining > 50
					@drop_down_value_10_breaker = loan.amount_remaining/50
					unless @drop_down_value_10_breaker.blank?
						1.upto(@drop_down_value_10_breaker) {|i|  @loan_drop_down_values << i*50}
						@loan_drop_down_values =  @loan_drop_down_values.uniq.sort 
						p "*******"
						p  @loan_drop_down_values
					end  
				elsif loan.amount_remaining <=  50 
					@loan_drop_down_values << loan.amount_remaining
					@loan_drop_down_values = @loan_drop_down_values.flatten
				end
			end
		end
		return @loan_drop_down_values 
	end

end
