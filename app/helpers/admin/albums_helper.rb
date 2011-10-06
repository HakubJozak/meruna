module Admin::AlbumsHelper

  def name_column(album)
    icon(:photo, album.name)
  end

  def when_column(album)
    album.when.to_date
  end
end
