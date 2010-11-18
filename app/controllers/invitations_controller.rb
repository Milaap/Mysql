class InvitationsController < ApplicationController
   def  authorize
       @invitation = Invitation.new
        respond_to do |format|
           format.html # new.html.erb
           format.xml  { render :xml => @invitation}
        end 
   end
   
   #for getting token from user
   def get_invitation_token
       @invitation = Invitation.where(params[:invitation]).first
        respond_to do |format|
           if !@invitation.blank?
	     @invitation.update_attributes(:invitation_confirm => true)
	     format.html {redirect_to(root_url, :notice => 'You are Authorized !! :)')}
	     format.xml  {render :xml => root_url, :status => :authorized, :location => root_url}
	   else
             format.html{redirect_to(authorize_invitations_url, :notice => 'Invitation Token not match. Sorry :(')}
	     format.xml  { render :xml => authorize_invitations_url }
	   end
        end
    end
    
    def new
       @invitation = Invitation.new
	respond_to do |format|
           format.html 
           format.xml { render :xml => @invitation }
	end
    end
  
    def create
        @invitation = Invitation.new(params[:invitation])
	@invitation.invitation_token = Invitation.generate_code
		
	respond_to do |format|
           if @invitation.save
             if !@invitation.blank? 
               # &&  user_signed_in? 
	        @invitation.update_attributes(:sender => "admin@millap.org", :sent_at => Time.now)
	        p ">>>object>>> saved.."
		p @invitation.inspect
	        MilaapMailer.send_token(@invitation).deliver
               # @user = User.find(current_user._id)
	#	@user.update_attributes!(:invitation_token  =>  @invitation.invitation_token,  :invitation_limit => @user.invitation_limit-1)
		format.html {redirect_to(verify_invitation_code_url, :notice => "Thank you,Invitation Token has been sent to your email address.Please check to get started.")}  	       
		format.xml  {render :xml => root_url, :location => root_url }
	      else
	        format.html {redirect_to(new_user_session_url, :notice => "You need to logged in to send invitaions :)")}  	       
		format.xml  {render :xml => new_user_session_url, :location => new_user_session_url }
	      end
            else
	       format.html {redirect_to(new_invitation_url, :notice => "All fields are compulsory field.")}  	       
	       format.xml  {render :xml => new_invitation_url, :status => :authorized, :location => root_url }
	    end
        end
   end
       
end  
    
    
  
