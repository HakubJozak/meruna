class AddColumnsToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :homepage, :string, :limit => 2048
    add_column :profiles, :logo_file_name, :string
    add_column :profiles, :logo_content_type, :string
    add_column :profiles, :logo_file_size, :integer
    add_column :profiles, :logo_updated_at, :datetime 
  end

  def self.down
    remove_columns :profiles, :homepage, :logo_file_name, :logo_file_size, :logo_content_type, :logo_updated_at
  end
end
