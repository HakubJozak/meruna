class Public::AlbumsController < Public::BaseController

  def index
    @albums = Album.find_filtered(params[:country])
    @years = @albums.group_by { |a| a.when.year }
  end

  def show
    pick_random_albums
    @album = Album.find(params[:id])
  end

  protected

  def pick_random_albums
    @random_albums = [ Album.first, Album.last ]
  end
end
