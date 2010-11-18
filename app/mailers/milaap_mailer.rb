class MilaapMailer < ActionMailer::Base
  default :from => "Milaap" + " " + "<administrator@milaap.org>"
  def send_token(user)
     @invitation = user
      p "......................."
      p  @invitation
      p  @invitation.invitation_token
      @url  = "#{HOST_PATH}/verify-invitation-code" 
      #authorize_invitations_url(:invitation_token => @invitation.invitation_token)
      mail(:to => user.recipient_email,
         :subject => "Milaap Invitation Token")
    #  @invitation.update_attribute(:sent_at, Time.now)	 
  end

  def welcome_email(user) 
    @user = user
    mail(:to => @user.email,:subject => "#{@user.first_name.capitalize unless @user.first_name.nil?} Welcome to Milaap!")
  end

  def send_info(users)
    @users = users
    mail(:to => ["ask4prasath@gmail.com", "prasath@milaap.org", "sourabhs@milaap.org",
                 "anoj@milaap.org", "mayukh@milaap.org", "deepa@milaap.org"], :subject => "Milaap User Details!")
  end


end
