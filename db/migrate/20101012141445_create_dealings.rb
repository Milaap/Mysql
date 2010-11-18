class CreateDealings < ActiveRecord::Migration
  def self.up
    create_table :dealings do |t|
      t.references :borrower_group
      t.references :loan
      t.references :borrower
      t.references :lender
      t.references :user
      t.string :payment_status
      t.string :transaction_type
      t.references :transaction
      t.integer :current_credit
      t.integer :transaction_amount
      t.integer :net_to_milaap
      t.string :payer_name
      t.string :payer_email
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :dealings
  end
end
