class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.string :recipent_email
      t.datetime :sent_at
      t.string :first_name
      t.string :last_name
      t.string :sender
      t.string :invitation_token
      t.string :invitation_confirm

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
