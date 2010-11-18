class Category  < ActiveRecord::Base

#  embeds_many :loans

  def self.find_loan_category(category_id)
    @category = self.first(:conditions => {:category_id =>category_id})
    return @category
  end


end
