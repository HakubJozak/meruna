class RenameNewsType < ActiveRecord::Migration
  def self.up
    rename_table :news_types, :content_types
  end

  def self.down
    rename_table :content_types, :news_types
  end
end
