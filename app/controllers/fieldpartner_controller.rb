class FieldpartnerController < ApplicationController
  def new
    @fp = FieldPartner.new()
  end

  def create
    @field_partner = FieldPartner.new(params[:fp])
    @field_partner.save! 
  end

end
