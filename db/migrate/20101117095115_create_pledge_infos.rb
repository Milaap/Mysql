class CreatePledgeInfos < ActiveRecord::Migration
  def self.up
    create_table :pledge_infos do |t|
      t.references :user
      t.string :email
      t.references :category
      t.float :amount
      t.string :currenecy_type
      t.string :period_type

      t.timestamps
    end
  end

  def self.down
    drop_table :pledge_infos
  end
end
