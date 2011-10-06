class CreateRegistrationKeys < ActiveRecord::Migration
  def self.up
    create_table :registration_keys do |t|
      t.string :code, :limit => 255, :null => false
      t.string :email, :null => false
      t.integer :user_id, :null => true, :foreign_key => :user
      t.timestamps
    end
  end

  def self.down
    drop_table :registration_keys
  end
end
