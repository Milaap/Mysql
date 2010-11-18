class Invitation < ActiveRecord::Base
 
    #validate :recipient_is_not_registered
    #validate :sender_has_invitations, :if => :sender
    validates  :first_name, :last_name , :presence => true
    validates  :recipient_email,  :presence => true, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}  
    
    #before_create :generate_code
    # before_create :decrement_sender_count
    #attr_accessible :recipient_email, :sender, :invitation_token,:sent_at,:first_name,:last_name
   
    private

    def recipient_is_not_registered
        errors.add :recipient_email, 'is already registered' if recipient_email = recipient_email
    end

    def sender_has_invitations
         user = User.where(:invitation_token  => self.invitation_token)
         unless user.invitation_limit > 0
         errors.add_to_base 'You have reached your limit of invitations to send.'
        end
    end
    
      
   def self.generate_code 
     chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
     newpass = ""
     1.upto(7) { |i| newpass << chars[rand(chars.size-1)] }
     return newpass
   end 

end
