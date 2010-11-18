'require active_merchant'

class PaypalController < ApplicationController
  include ActiveMerchant::Billing::Integrations

	def ipn
		begin
			notification = Paypal::Notification.new(request.raw_post)
			if !params[:cm].blank?
				p_custom = params[:cm]
			elsif  !params[:custom].blank?
				p_custom = params[:custom].gsub('%3a',':').gsub('%2c',',')
			end  
			if !params[:payment_gross].blank?
				p_amt = params[:payment_gross].to_f 
			elsif !params[:amt].blank?
				p_amt = params[:amt].to_f
			end
			if !params[:payment_status].blank? 
				payment_status = params[:payment_status] 
			elsif !params[:st].blank?
				payment_status = params[:st]
			end
			unless p_custom.blank?
				transcation_id = params[:txn_id] || params[:tx]
				@millap_balance = MilaapBalance.first
				@borrower = Borrower.first(:conditions => {:id =>p_custom})
				@loan = Loan.first(:conditions => {:loan_id => @borrower.loan_id})
				if payment_status == "Completed"
					@transaction_fee =  ( p_amt.to_f * 4) /100.to_f
					@dealing = Dealing.first(:conditions=>{:transaction_id=>transcation_id}) 
					if @dealing.blank? 
						#Dealing.transaction do
							add_credit_transaction = Dealing.new
							add_credit_transaction.dealing_id = Dealing.all.length + 1
							add_credit_transaction.borrower_id = @borrower.borrower_id
							add_credit_transaction.loan_id = @borrower.loan_id
							add_credit_transaction.borrower_group_id = @borrower.borrower_group_id
							add_credit_transaction.transaction_type = 'Credit-added'
							add_credit_transaction.transaction_amount = p_amt.to_f              
							add_credit_transaction.current_credit = @loan.amount_funded.to_f + p_amt.to_f
							add_credit_transaction.transaction_id = transcation_id
							add_credit_transaction.payment_status = payment_status
							add_credit_transaction.payer_name = params[:address_name]
							add_credit_transaction.payer_email = params[:payer_email]
							add_credit_transaction.net_to_milaap = p_amt.to_f
							add_credit_transaction.email = session[:email]
							add_credit_transaction.user_id = current_user._id
							add_credit_transaction.save
						#end
						@lender = Lender.first(:conditions => {:email =>session[:email]})  
						if @lender.blank?
							@lender = Lender.new
							@lender.lender_id = Lender.all.length + 1
							@lender.user_id = current_user._id
							@lender.email  = session[:email]
							@lender.total_amount_loaned = (p_amt.to_f - @transaction_fee.to_f)
							@lender.save
							current_user.update_attributes(:user_type=>"lender")       
						else
							current_user.update_attributes(:user_type=>"lender")
							@lender.total_amount_loaned = (@lender.total_amount_loaned + (p_amt.to_f - @transaction_fee.to_f) )
							@lender.save
						end
						@loanlender = LoanLender.new
						@loanlender.loan_id = @loan.loan_id
						@loanlender.lender_id = @lender.lender_id
						@loanlender.transaction_id = transcation_id  
						@loanlender.lender_email = @lender.email  unless @lender.email.blank?
						@loanlender.amount = (p_amt.to_f - @transaction_fee.to_f)
						@loanlender.save 
						@amt_remaining = @loan.amount_remaining - ( p_amt.to_f - @transaction_fee.to_f)
						@loan.update_attributes(:amount_remaining=>@amt_remaining)
						if $visiting_user_country == "India" 	 
							@loan.update_attributes(:loan_amount_remaining_in_rupees=>(@loan.loan_amount_remaining_in_rupees - (( p_amt.to_f - @transaction_fee.to_f) * 45 )))
						else
							@loan.update_attributes(:loan_amount_remaining_in_rupees=> (@loan.loan_amount_remaining_in_rupees - (( p_amt.to_f - @transaction_fee.to_f).round(2)*45).floor))
						end 
						@millap_balance.balance=@millap_balance.balance.to_f + p_amt
						@millap_balance.save!
						session[:id] = nil
						session[:loan_id] = nil
						session[:amount] = nil
						session[:transaction_fee] = nil  
						session[:indian_amt] = nil
						session[:email] = nil
						flash[:notice_green] = "Loan added sucessfully"
						redirect_to borrower_profile_path(:id=>@borrower.borrower_id,:name=>@borrower.name.gsub(/\W+/,'-'))
				end
			else
				flash[:notice] = "Payment status is pending."
				redirect_to root_path 
			end 
		end
	rescue 
		flash[:notice] = "unsucessfull transaction"
		redirect_to root_path
	end
	end 



		end
