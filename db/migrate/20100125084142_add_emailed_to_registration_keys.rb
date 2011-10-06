class AddEmailedToRegistrationKeys < ActiveRecord::Migration
  def self.up
    add_column :registration_keys, :emailed_at, :date, :null => true
  end

  def self.down
    remove_column :registration_keys, :emailed_at
  end
end
