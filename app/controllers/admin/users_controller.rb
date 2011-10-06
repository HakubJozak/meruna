class Admin::UsersController < Admin::BaseController
  active_scaffold :users do |c|
    c.columns = [ :login, :email, :fullname, :password, :password_confirmation, :openid_identifier ]
    c.list.columns = [ :login, :email, :fullname ]
  end
end
