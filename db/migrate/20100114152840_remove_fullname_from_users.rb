class RemoveFullnameFromUsers < ActiveRecord::Migration
  def self.up
    [ :fullname, :email ].each do |col|
      change_column :users, col, :string, :null => true
    end
  end

  def self.down
    [ :fullname, :email ].each do |col|
      change_column :users, col, :string, :null => false
    end
  end
end
