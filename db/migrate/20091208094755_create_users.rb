class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      # common
      t.string :fullname, :null => false
      t.string :email, :null => false

      # native login
      t.string :login
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token

      t.timestamps
    end

    add_index :users, :email
  end

  def self.down
    drop_table :users
  end
end
