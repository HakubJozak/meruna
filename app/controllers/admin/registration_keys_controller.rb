class Admin::RegistrationKeysController < Admin::BaseController
  active_scaffold :registration_keys do |c|
    c.columns = [ :email ]
    c.list.columns = [ :email, :code, :emailed_at ]
  end
end
