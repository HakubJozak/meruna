class AddColsToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :order, :integer, :default => 1, :null => false
    add_column :banners, :name, :string
  end

  def self.down
    remove_columns :banners, :order, :name
  end
end
