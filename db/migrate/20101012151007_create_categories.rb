class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.string :permalink
      t.string :category_logo

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
