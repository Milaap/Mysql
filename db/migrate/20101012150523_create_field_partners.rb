class CreateFieldPartners < ActiveRecord::Migration
  def self.up
    create_table :field_partners do |t|
      t.references :community
      t.string :info
      t.references :field_partner
      t.string :name
      t.integer :yrs_of_existance
      t.integer :lending_rate
      t.integer :repayment_rate
      t.integer :deliquency_rate
      t.integer :credit_rating
      t.string :information
      t.string :logo
      t.string :url
      t.string :field_partner_type
      t.string :total_loan_portfolio
      t.string :rating_agency
      t.integer :total_no_of_borrowers
      t.string :no_of_SHGS
      t.string :no_of_villages
      t.integer :no_of_districts_operating
      t.integer :no_of_poorest_districts
      t.float :percentage_of_women_borrowers
      t.float :percentage_rural

      t.timestamps
    end
  end

  def self.down
    drop_table :field_partners
  end
end
