module Public::AlbumsHelper

  def cover_url(album)
    if album.cover
      album.cover.picture.url(:thumb)
    else
      logger.warn("Album #{album.id} does not have cover")
      'empty.gif'
    end
  end

  def render_photos(photos, partial = 'photo')
    result = ''
    
    photos.each_with_index do |photo,i| 
      clazz = (i % 4 == 3) ? 'photo last' : 'photo' 
      result += render( :partial => partial, :object => photo, :locals => { :clazz => clazz })
    end   
  
    result
  end

end
