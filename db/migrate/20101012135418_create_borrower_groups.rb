class CreateBorrowerGroups < ActiveRecord::Migration
  def self.up
    create_table :borrower_groups, :id => false do |t|
      t.references :loan
      t.references :field_partner
      t.references :borrower
      t.references :group

      t.timestamps
    end
  end

  def self.down
    drop_table :borrower_groups
  end
end
