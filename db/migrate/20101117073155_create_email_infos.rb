class CreateEmailInfos < ActiveRecord::Migration
  def self.up
    create_table :email_infos do |t|
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :email_infos
  end
end
