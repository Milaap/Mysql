class CreateMilaapBalances < ActiveRecord::Migration
  def self.up
    create_table :milaap_balances do |t|
      t.float :balance

      t.timestamps
    end
  end

  def self.down
    drop_table :milaap_balances
  end
end
