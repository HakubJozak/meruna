Factory.define :registration_key do |k|
  k.email 'jakub.hozak@gmail.com'
end


Factory.define :active_key, :parent => :registration_key do |k|
  k.association :user, :factory => :openid_user
end

