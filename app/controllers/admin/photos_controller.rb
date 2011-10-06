class Admin::PhotosController < Admin::BaseController
  helper 'admin/photos'

  active_scaffold :photos do |c|
    c.columns = [ :description, :picture ]
  end
end
