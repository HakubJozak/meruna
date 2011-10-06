class AddPublishedToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :happened_on, :date
  end

  def self.down
    remove_columns :albums, :happened_on
  end
end
