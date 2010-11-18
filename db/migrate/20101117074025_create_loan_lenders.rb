class CreateLoanLenders < ActiveRecord::Migration
  def self.up
    create_table :loan_lenders do |t|
      t.references :lender
      t.float :amount
      t.string :lender_email
      t.integer :transaction_id

      t.timestamps
    end
  end

  def self.down
    drop_table :loan_lenders
  end
end
