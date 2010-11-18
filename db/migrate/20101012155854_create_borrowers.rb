class CreateBorrowers < ActiveRecord::Migration
  def self.up
    create_table :borrowers do |t|
      t.string :country
      t.string :name
      t.string :gender
      t.string :photo
      t.string :village
      t.string :taluka
      t.string :district
      t.string :state
      t.references :loan
      t.references :borrower_group
      t.references :field_partner
      t.text :borrower_story
      t.references :community
      t.integer :poverty_level
      t.string :impact_story_image
      t.references :lender
      t.integer :age
      t.string :profile_image
      t.string :home_image
      t.string :search_image
      t.string :education
      t.integer :avg_monthly_income
      t.string :occupation
      t.string :credit_rating
      t.string :name_of_student
      t.string :relationship_with_applicant
      t.string :SHG
      t.string :purpose
      t.datetime :date_disbursed
      t.date :date_of_final_payment
      t.float :interest_rate
      t.float :loan_amount
      t.integer :term

      t.timestamps
    end
  end

  def self.down
    drop_table :borrowers
  end
end
