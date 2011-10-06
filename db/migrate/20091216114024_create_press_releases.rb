class CreatePressReleases < ActiveRecord::Migration
  def self.up
    create_table :press_releases do |t|
      t.string :title
      t.text :body
      t.date :released_at
      t.timestamps
    end
  end

  def self.down
    drop_table :press_releases
  end
end
