class Admin::CalendarsController < Admin::BaseController
  active_scaffold :calendar do |c|
    c.columns = [ :name, :url ]
  end
end
