class AddPaperclipToHeadline < ActiveRecord::Migration

  def self.up
    add_column :headlines, :image_file_name, :string
    add_column :headlines, :image_content_type, :string
    add_column :headlines, :image_file_size, :integer
    add_column :headlines, :image_updated_at, :datetime
  end

  def self.down
    add_column :headlines, :image_file_name, :string
    add_column :headlines, :image_content_type
    add_column :headlines, :image_file_size, :integer
    add_column :headlines, :image_updated_at, :datetime
  end
  
end
