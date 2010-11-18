class Borrower <ActiveRecord::Base
#  embeds_one :loan
#  embeds_one :borrower_group
#  embeds_one :lender
#  embeds_one :field_partner
#  embeds_one :community
#
#  field :borrower_id, :type => Integer
#  field :borrower_group_id, :type => Integer
#  field :loan_id, :type => Integer
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
#  field :community_id, :type => String
#  field :education, :type => String
#  field :avg_monthly_income, :type => Float
#  field :occupation, :type => String
#  field :borrower_story, :type => String
#  field :poverty_level, :type => Float
#  field :credit_rating, :type => String
#  field :impact_story_image, :type => String
#  field :name_of_student, :type => String
#  field :relationship_with_applicant, :type => String

  def self.find_loan_borrower(loan_id)
    @borrower = self.first(:conditions => {:loan_id =>loan_id})
    return @borrower
  end



end
