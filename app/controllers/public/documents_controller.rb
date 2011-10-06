class Public::DocumentsController < Public::BaseController
  def index
    @documents = Document.find_filtered(params[:country])
  end

  def download
    @doc = Document.find(params[:id], :order => :created_at)
    send_file @doc.file.path, :content_type => @doc.file.content_type
  end

end
