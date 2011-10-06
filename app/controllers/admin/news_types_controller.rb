class Admin::NewsTypesController < Admin::BaseController
  active_scaffold :news_types do |c|
    c.columns = [ :name, :icon ]
  end
end
