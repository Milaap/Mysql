class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.integer :amount_funded
      t.integer :amount_remaining
      t.integer :amount_repaid
      t.float :loan_funded_percentage
      t.string :title
      t.string :info
      t.references :category
      t.datetime :date_listed
      t.datetime :expiry_date
      t.datetime :date_of_disbursement_of_loan
      t.integer :amount
      t.string :terms
      t.string :repayment_cycle
      t.datetime :date_of_disbursement_of_loan
      t.string :loan_status
      t.float :interest_rate
      t.string :field_partner_name
      t.string :social_impact
      t.text :social_impact_story
      t.references :field_partner
      t.float :loan_amount_in_dollar
      t.string :loan_impact_story
      t.float :loan_amount_remaining_in_dollar
      t.float :loan_amount_in_rupees
      t.float :loan_amount_remaining_in_rupees
      t.float :date_of_final_payment
      t.string :purpose


      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
