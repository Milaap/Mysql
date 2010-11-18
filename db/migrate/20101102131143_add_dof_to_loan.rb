class AddDofToLoan < ActiveRecord::Migration
  def self.up
#    add_column :loans, :date_of_final_payment, :float
  end

  def self.down
    remove_column :loans, :date_of_final_payment
  end
end
