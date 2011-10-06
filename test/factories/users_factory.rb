Factory.define :user do |u|
end

Factory.define :google_user, :parent => :user do |u|
  u.openid_identifier 'https://www.google.com/accounts/o8/id'
end

Factory.define :openid_user, :parent => :user do |u|
  u.openid_identifier 'http://openid.cz/jakub.hozak@gmail.com'
end

Factory.define :native_user, :parent => :user do |u|
  u.login 'kuba'
  u.fullname 'Jakub Hozak'
  u.email 'kuba@example.com'
  u.password 'hesloheslo'
  u.password_confirmation 'hesloheslo'
end

# TODO - add roles
Factory.define :admin, :parent => :native_user do |u|
  u.login 'admin'
end
