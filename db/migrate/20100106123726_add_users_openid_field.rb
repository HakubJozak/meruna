class AddUsersOpenidField < ActiveRecord::Migration
  def self.up
    add_column :users, :openid_identifier, :string
    add_index :users, :openid_identifier

    change_column :users, :login, :string, :default => nil, :null => true
    change_column :users, :crypted_password, :string, :default => nil, :null => true
    change_column :users, :password_salt, :string, :default => nil, :null => true
  end

  def self.down
    remove_column :users, :openid_identifier

    [:login, :crypted_password, :password_salt].each do |field|
      User.all(:conditions => "#{field} is NULL").each do |user|
        user.update_attribute(field, "") if user.send(field).nil?
      end

      change_column :users, field, :string, :default => "", :null => false
    end
  end
end
