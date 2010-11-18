class FieldPartner < ActiveRecord::Base
#  embeds_many :lenders
#  embeds_many :borrowers
#  embeds_many :borrower_groups
#  embeds_many :loans


  def self.find_borrower_field_partner(field_partner_id)
    @field_partner = self.first(:conditions => {:field_partner_id =>field_partner_id})
  end

end
