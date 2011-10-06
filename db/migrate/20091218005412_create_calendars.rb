class CreateCalendars < ActiveRecord::Migration
  def self.up
    create_table :calendars do |t|
      t.string :name, :null => false
      t.string :url, :limit => 2048, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :calendars
  end
end
