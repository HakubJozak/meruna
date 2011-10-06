class CreateHeadlines < ActiveRecord::Migration
  def self.up
    create_table :headlines do |t|
      t.string :title, :null => false
      t.string :short, :null => false, :limit => 1024
      t.text :long, :null => false
      t.references :news_type
      t.timestamps
    end
  end

  def self.down
    drop_table :headlines
  end
end
