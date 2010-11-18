class CreateCommunities < ActiveRecord::Migration
  def self.up
    create_table :communities do |t|
      t.text :info
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :communities
  end
end
