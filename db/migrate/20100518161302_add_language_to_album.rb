class AddLanguageToAlbum < ActiveRecord::Migration
  def self.up
    id = Language.first.id
    add_column :albums, :language_id, :integer, :null => false, :default => id
  end

  def self.down
    remove_columns :albums, :language_id
  end
end
