class Admin::BannersController < Admin::BaseController
  active_scaffold 'Banner' do |c|
    c.columns = [ :order, :name, :link, :picture ]
  end
end
