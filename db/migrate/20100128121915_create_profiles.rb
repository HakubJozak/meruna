class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name, :null => false
      t.string :contact_person
      t.string :contact_email
      t.text :address
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
