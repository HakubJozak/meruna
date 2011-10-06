class Admin::AlbumsController < Admin::BaseController
  helper 'admin/albums'

  active_scaffold :albums do |c|
    c.columns = [ :name, :language, :happened_on ]
    c.list.columns = [ :when, :name, :photos ]
    c.columns[:language].form_ui = :select

    c.action_links.add :upload_zip,
      :label => 'Upload Zipfile',
      :popup => false,
      :type => :record,
      :method => :get,
      :inline => true,
      :position => :after
  end

  def upload_zip
    @album = Album.find(params[:id])
    zip = params[:zip]

    if params[:commit]
      if zip
        @album.import_zip(zip.path)
        flash[:info] = 'Photos updated'
      else
        flash[:error] = 'Please, select zip file'
      end

      redirect_to :action => :index
    else
      render :partial => 'upload_zip'
    end
  rescue => e
    logger.error("Failed to import album #{e}")
    flash[:error] = 'Failed to import the photos'
    redirect_to :action => :index
  end
end
