class Admin::LanguagesController < Admin::BaseController
  active_scaffold :languages do |c|
    c.list.columns = [ :flag, :name, :code ]
  end

end
