class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title, :null => false
      t.string :path, :null => false
      t.string :key, :null => false
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
