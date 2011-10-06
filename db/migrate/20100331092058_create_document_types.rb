class CreateDocumentTypes < ActiveRecord::Migration
  def self.up
    add_column :news_types, :type, :string, :default => 'NewsType', :null => false
    add_column :documents, :document_type_id, :integer
  end

  def self.down
    remove_column :news_types, :type
    remove_column :documents, :document_type_id
  end
end
