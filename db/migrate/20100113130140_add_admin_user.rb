class AddAdminUser < ActiveRecord::Migration
  def self.up
    p = "admin"
    User.create( :login => 'admin', :fullname => 'Administrator',
                 :password => p, :password_confirmation => p,
                 :email => 'meruna@inexsda.cz' )
  end

  def self.down
    User.delete_all
  end
end
