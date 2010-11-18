class CreateLoanRepayments < ActiveRecord::Migration
  def self.up
    create_table :loan_repayments do |t|
      t.references :loan
      t.datetime :repayment_date
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :loan_repayments
  end
end
