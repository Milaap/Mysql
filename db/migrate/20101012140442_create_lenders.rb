class CreateLenders < ActiveRecord::Migration
  def self.up
    create_table :lenders do |t|
      t.references :user
      t.string :name
      t.string :city
      t.string :country
      t.string :photo
      t.string :karma_points
      t.string :user_referred_to
      t.integer :total_amount_loaned
      t.integer :total_amount_repaid
      t.integer :total_amount_cashed_out
      t.integer :milaap_credits
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :lenders
  end
end
