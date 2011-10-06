class CreateNewsTypes < ActiveRecord::Migration
  def self.up
    create_table :news_types do |t|
      t.string :name, :null => false
      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :news_types
  end
end
