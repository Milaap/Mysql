class BorrowerController < ApplicationController
   def new
    @borrower = Borrower.new()
  end

  def create
    @borrower = Borrower.new(params[:borrower])
    @borrower.save!
  end

end
