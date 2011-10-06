class AddNewsTypesData < ActiveRecord::Migration
  def self.up
    add_column :press_releases, :news_type_id, :integer, :null => false
  end

  def self.down
    remove_columns :press_releases, :news_type_id
  end
end
