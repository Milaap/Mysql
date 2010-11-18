class HomeController < ApplicationController

#before_filter :check_loan_pledged, :except =>[:index,:save_email_info,:verify_invitation_code,:about,:how_it_work,:get_envolved,:contact_us,:advisory_board,:team,:volunteer,:terms,:jobs,:privacy,:who_we_are,:thank_you,:why_milaap,:pledge, :welcome]
#layout 'alpha', :only=>[:verify_invitation_code]
#layout 'application', :except=>[:verify_invitation_code,:borrower_profile,:view_all_projects,:lend_money_to_borrower,:pledge,:test]
#layout :resolve_layout
 before_filter :authenticate_user!, :only => :welcome

layout  'application'

 def index
#      find_geo_location
    session[:id] = nil
    session[:loan_id] = nil
    session[:amount] = nil
    session[:transaction_fee] = nil
    @title= "MILAAP - Beyond Just Credit"
    session[:tab] = "home"
    sets = ["set1", "set2"]
    @image_path = sets[rand(sets.size)]
    #Rails.logger.info "**************"
    #Rails.logger.info Borrower.find(:all, :limit => 3)
    #Rails.logger.info Borrower.all.limit(3).order_by([:loan_id,:desc])
      @borrowers = Borrower.find(:all, :limit => 3)
 end

 def borrower_profile
  find_geo_location
  @title= "MILAAP - Beyond Just Credit"
  @borrower = Borrower.find(params[:id])
  unless @borrower.blank?
    @loan = Loan.find(@borrower.loan_id)
    @loan_repayments = LoanRepayment.all(:conditions => {:loan_id =>@borrower.loan_id})
    @category = Category.find(@loan.category_id)
    @loan_lenders = LoanLender.all(:conditions => {:loan_id =>@loan.id})
    @loan_funded_percentage = (100 * (@loan.loan_amount_in_dollar - @loan.amount_remaining))/@loan.loan_amount_in_dollar
    @loan_drop_down_values = Loan.find_loan_drop_down_values(@loan,$visiting_user_country)
    #code for google map 
     borrower_address = "#{@borrower.village}" +" "+ "#{@borrower.taluka}"+" "+"#{@borrower.district}"" "+"#{@borrower.state}"" " +"#{@borrower.country}"
     Rails.logger.info "++++++++++++++++++++#{borrower_address}+++++++++++++++++++++++"
     @map = GMap.new("map_div")
     @map.control_init(:large_map => true,:map_type => true)
     results = Geocoding::get("#{borrower_address}") #if results.status == Geocoding::GEO_SUCCESS
     Rails.logger.info "_______#{results}-------------"
     coord = results[0].latlon
     Rails.logger.info "========#{coord}==========="
     @map.center_zoom_init(coord,9)
     @map.overlay_init(GMarker.new(coord,:info_window => "#{borrower_address}"))
  #   render :layout => 'borrower'
  end 
end

	def view_all_projects
		session[:tab] = "pledge"	  
		find_geo_location	 
		@categories = Category.all
		if params[:category]
			@catgry =  Category.first(:conditions => {:name =>params[:category]})
			unless @catgry.blank?
				@loans = Loan.all(:conditions => {:category_id =>@catgry.category_id}).order_by([:loan_id,:desc])
				@loans = @loans.paginate :page => params[:page], :per_page =>5  
				if  @loans.blank?
          flash[:notice] ="We are working on getting loans for the cause that you want to support. It will take us some time. In the meanwhile, you can take a look at other causes and support them."				  
					@loans = Loan.all.order_by([:loan_id,:desc])
				  @loans = @loans.paginate :page => params[:page], :per_page =>5
				end
			else
				@title= "MILAAP - Beyond Just Credit"
				@loans = Loan.all.order_by([:loan_id,:desc])
				@loans = @loans.paginate :page => params[:page], :per_page =>5
			end 
		else
			@title= "MILAAP - Beyond Just Credit"
			@loans = Loan.find(:all, :order => "id desc")
			@loans = @loans.paginate :page => params[:page], :per_page =>5
		end
	end

  
 def lender_profile
  @title= "MILAAP - Beyond Just Credit"
 end

	def lend_money_to_borrower
		 session[:tab] = "pledge"
		 session[:email] = current_user.email
		find_geo_location
		
		@categories = Category.all
		#begin  
			if request.post?
				p "***************"
				p params[:id]
				session[:email] = current_user.email
				session[:id] = params[:id]
				session[:loan_id] = params[:loan_id]
				session[:amount] = params[:amount_1]  
				@borrower = Borrower.first(:conditions => {:id => params[:id]})
			  @loan = Loan.first(:conditions => {:loan_id =>session[:loan_id]})
				@category =  Category.first(:conditions => {:category_id => @loan.category_id})
				@loan_funded_percentage = (100 * (@loan.loan_amount_in_dollar - @loan.amount_remaining))/@loan.loan_amount_in_dollar
				#@loan_funded_percentage = Loan.first(:conditions => {:loan_id =>params[:loan_id]})
				if $visiting_user_country == "India"
					@indian_amt  = params[:amount_1]
				  amt = (params[:amount_1].to_f/45).round(2).ceil
				  @amount = amt  
          @transaction_fee_in_indian_rupees =  ((@indian_amt.to_f*4)/100).round(2)
					session[:indian_amt] = @indian_amt
					@actual_funded_amt = @indian_amt
					
			  else
				  @amount  = params[:amount_1]
					@actual_funded_amt = @amount
				end 
				session[:transaction_fee] = ((@amount.to_f*4)/100).round(2)
			   if $visiting_user_country == "India"
					 @actual_amt = params[:amount_1]
           @drop_down_amt =  params[:amount_1].to_f/45
         else
					 @actual_amt = params[:amount_1]
           @drop_down_amt =  params[:amount_1].to_f
         end 
         @new_loan_funded_percentage = ((100 * (@loan.loan_amount_in_dollar - @drop_down_amt))/@loan.loan_amount_in_dollar).round(2).ceil
	       @actual_new_loan_funded_percentage = 100  - @new_loan_funded_percentage ;
         @actual_new_loan_funded_percentage = @actual_new_loan_funded_percentage.round(2).ceil
				
				
				
				
			else
				
				@borrower = Borrower.first(:conditions => {:id =>  session[:id]})
				@loan = Loan.first(:conditions => {:loan_id =>session[:loan_id]})
				@category =  Category.first(:conditions => {:category_id => @loan.category_id})
				@loan_funded_percentage = (100 * (@loan.loan_amount_in_dollar - @loan.amount_remaining))/@loan.loan_amount_in_dollar

				#@amount = session[:amount] 
				if $visiting_user_country  =="India"
					@indian_amt  =  session[:amount] 
				  amt = ( session[:amount] .to_f/45).round(2).ceil
				  @amount = amt   
					@transaction_fee_in_indian_rupees =  ((@indian_amt.to_f*4)/100).round(2)
					session[:indian_amt] = @indian_amt
					@actual_funded_amt = @indian_amt
				else
				  @amount  = session[:amount] 
					@actual_funded_amt = @amount
				end 
			  session[:transaction_fee] = ((@amount.to_f*4)/100).round(2)
				 if $visiting_user_country == "India"
           @drop_down_amt =  session[:amount].to_f/45
					 
         else
           @drop_down_amt = session[:amount].to_f
         end 
         @new_loan_funded_percentage = ((100 * (@loan.loan_amount_in_dollar - @drop_down_amt))/@loan.loan_amount_in_dollar).round(2).ceil
	       @actual_new_loan_funded_percentage = 100  - @new_loan_funded_percentage ;
         @actual_new_loan_funded_percentage = @actual_new_loan_funded_percentage.round(2).ceil
				
				
				
				
			 
			end
		#render :layout => 'borrower'
		#rescue
			#redirect_to root_path 
		#end
    end


  def welcome
    @title= "MILAAP - Beyond Just Credit"
  end
 
  def about
    @title= "About MILAAP - Beyond Just Credit"
  end
  
  def contact_us
    @title= "MILAAP - Beyond Just Credit"
  end

  def get_envolved
    @title= "MILAAP - Beyond Just Credit"
    session[:tab] ="get_envolved"
  end

  def how_it_work
    @title= "MILAAP - Beyond Just Credit"
    session[:tab] ="how_it_work" 
  end  
  
  
  def advisory_board
  end  
  
  def team
  end
  
  def volunteer
  end
  
  def terms
  end
  
  def jobs
  end
  
  
  def privacy
  end
  
  def who_we_are
   session[:tab] ="who_we_are"
  end

  def alpha_home
    
  end
  
 def thank_you
 end

 def why_milaap
	 session[:tab] = 'why_milaap'
 end
 
	def pledge
#		session[:tab] = nil
#		if request.post?
#			unless  params[:amount].blank?
#				if  params[:category_choosen] == ""
#					flash[:notice] = "Please choose category."
#				else
#					p "********11----------"
#					if user_signed_in?
#						category = Category.first(:conditions => {:name => params[:category_choosen]})
#						PledgeInfo.create(:user_id=>current_user._id,:email=>current_user.email,:category_id=>category.category_id,:amout=>params[:amount].strip,:currency_type=>params[:amount_currency],:period_type=>params[:amount_period_type],:pledge_id=>"loan_pledged_#{PledgeInfo.all.length+1}")
#						current_user.loan_pledged=true
#						current_user.save!
#						session[:pledged] = true
#						flash[:notice] ="Thank you for the pledge. You can now view the list of entrepreneurs you can support today."
#						redirect_to view_all_projects_path(:category=>category.name)
#					else
#						category = Category.first(:conditions => {:name => params[:category_choosen]})
#						@pledgeinfo = PledgeInfo.create(:category_id=>category.category_id,:amout=>params[:amount].strip,:currency_type=>params[:amount_currency],:period_type=>params[:amount_period_type],:pledge_id=>"loan_pledged_#{PledgeInfo.all.length+1}")
#						session[:pledged] = true
#						flash[:notice] ="Thank you for the pledge. You can now view the list of entrepreneurs you can support today."
#						cookies[:loan_pledged] = {
#							:value => "#{@pledgeinfo.pledge_id}" ,
#							:expires => 30.days.from_now.utc
#						}
#						redirect_to new_user_registration_url
#					end
#				end
#			else
#				flash[:notice] = "Amount can not be blank."
#			end
#		else
#			unless user_signed_in?
#				unless cookies[:loan_pledged].blank?
#					@pledge = PledgeInfo.first(:conditions => {:pledge_id=>cookies[:loan_pledged]})
#					unless @pledge.blank?
#						category = Category.first(:conditions => {:category_id =>@pledge.category_id})
#						p category.name
#						unless @pledge.email.blank?
#							@user = User.first(:conditions => {:email => @pledge.email})
#							unless @user.blank?
#								unless @user.first_name.blank?
#									flash[:notice] = "Hi #{@user.first_name.titleize}, Looks like you pledged a loan for '#{category.name.titleize}' during your last visit. Why not make a loan today?"
#								else
#								 unless @user.facebook_name.blank?
#									  flash[:notice] = "Hi #{@user.facebook_name.titleize}, Looks like you pledged a loan for '#{category.name.titleize}' during your last visit. Why not make a loan today?"
#								 else
#									  flash[:notice] ="Hi, Looks like you pledged a loan for '#{category.name.titleize}' during your last visit. Why not make a loan today?"
#									end
#								end
#								redirect_to new_user_session_url
#							end
#						else
#							flash[:notice] ="Hi, Looks like you pledged a loan for '#{category.name.titleize}' during your last visit. Why not fill in your details and view a list of enterprenurs that you can support."
#							redirect_to new_user_registration_url
#						end
#					end
#				end
#			end
#		end
	end

 def verify_invitation_code 
  #session[:original_uri] = request.env["HTTP_REFERER"]
  #p "************ I am here too********************"  
  #p session[:original_uri]
  if user_signed_in?
    if current_user.invitation_flag == true
      session[:correct_invitation_token] = true
    elsif current_user.invitation_flag == false
      unless params[:invitation].blank?  
        p "**************** I am here *******************"
        @invitation =  Invitation.first(:conditions => {:invitation_token => params[:invitation]})
        unless @invitation.blank?
          
	 if current_user.email == @invitation.recipient_email 
	   session[:correct_invitation_token] = true
	   current_user.invitation_flag=true
	   current_user.save 
	   redirect_to alpha_home_url 
         else
          flash[:notice] = "Please enter valid invitation code to access this page"
          redirect_to :back  
         end
         
        else
         flash[:notice] = "Please enter valid invitation code to access this page"
         redirect_to :back  
        end
      else
         flash[:notice] = "Please enter valid invitation code to access this page"
         #redirect_to :back
      end
    end
  else
    unless params[:invitation].blank? 
      @invitation =  Invitation.first(:conditions => {:invitation_token => params[:invitation]})
      unless @invitation.blank?
       session[:correct_invitation_token] = true
       redirect_to new_user_registration_path
      else 
	if session[:correct_invitation_token]
         redirect_to view_all_projects_path
	end
      end  
    end
  end 
 end


 def campaign

 end



  #def verify_invitation_code 
   #if user_signed_in?
      #if current_user.invitation_flag == true 
       #session[:correct_invitation_token] = true
      #end  
     #if request.post?
     
      #if current_user.invitation_flag == true 
       #session[:correct_invitation_token] = true
      #else  
       #unless params[:invitation].blank? 
	 #@invitation =  Invitation.first(:conditions => {:invitation_token => params[:invitation]})
	 #unless @invitation.blank?
	   #if current_user.email == @invitation.recipient_email 
	    #session[:correct_invitation_token] = true
	    #redirect_to alpha_home_url 
	    #current_user.invitation_flag=true
	    #current_user.save 
	    #redirect_to view_all_projects_path
	   #else
	     #flash[:notice] = "Please enter valid invitation code"
	    # redirect_to :back  
	   #end  
	 #else 
	  # flash[:notice] = "Invalid invitation code"
	 #  redirect_to :back  
	# end
       #end
      
      #end 
     #else
      #p "====raju=="
      #if current_user.invitation_flag == true 
      # session[:correct_invitation_token] = true
      #else
       #session[:correct_invitation_token] = false  
     # end   
     
    #end
   #else
     #if request.post?
      #unless params[:invitation].blank? 
	 #@invitation =  Invitation.first(:conditions => {:invitation_token => params[:invitation]})
	 #unless @invitation.blank?
           #session[:correct_invitation_token] = true
	  # redirect_to alpha_home_url
         #else  
	  # flash[:notice] = "Please enter valid invitation code"
	 #  redirect_to :back  
        # end
       #else 
        #flash[:notice] = "Invalid invitation code"
	#redirect_to :back 
    #   end  
       
   #  end  
  # end
 #end 
 
	def edit_user_account 
		if user_signed_in?
			@user = current_user
			if request.post?
        @user.first_name  = params[:user][:first_name] unless params[:user][:first_name].blank?
				@user.last_name  = params[:user][:last_name] unless params[:user][:last_name].blank?
				@user.country  = params[:user][:country] unless params[:user][:country].blank?
				@user.city  = params[:user][:city] unless params[:user][:city].blank?
				@user.intro  = params[:user][:intro] unless params[:user][:intro].blank?
		  	@user.save!
				if params[:user][:image_url] and @user 
					unless params[:user][:image_url].blank?
						filename = User.save_picture(params[:user][:image_url], @user._id)
						if filename != nil
							@user.update_attribute('image_url', "#{params[:user][:image_url]}")
							@user.update_attribute('profile_image', "profile_#{filename}")
						else
							@user.update_attribute('image_url',nil)
							@user.update_attribute('profile_image',nil)
						end
					end
				end
				flash[:notice] = "Profile updated sucessfully."
  		end
		else
			redirect_to root_path
		end 
	end 
	
	def  save_email_info
		 if request.post?
			 unless params[:email_address].blank?
	       EmailInfo.create(:email_id=>EmailInfo.all.length+1,:email=>params[:email_address])		 
       	 flash[:notice] = "Thanks for your interest in Milaap email updates. We will keep sending email updates on your email address."
			 end	 
		end 
		 redirect_to root_path
	end	
 
  private

	def resolve_layout
		case action_name
		when "borrower_profile", "view_all_projects","pledge","test","lend_money_to_borrower"
			"borrower"
		else
			"application"
		end
	end

    
  
end
