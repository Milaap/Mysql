class Community < ActiveRecord::Base
#  embeds_many :borrowers

   
  def self.find_borrower_community(community_id)
    @community = self.first(:conditions => {:community_id => community_id})
    return  @community
  end

end
