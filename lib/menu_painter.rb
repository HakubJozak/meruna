

module MenuPainter

  def self.draw(text)
    draw_one(text, nil)
    draw_one(text, '-hover')
  end

  def self.draw_one(text, hover = nil)
    drawable = Magick::Draw.new
    drawable.pointsize = 14
    drawable.font = ("#{RAILS_ROOT}/db/fonts/BigSlabHammer_cz.ttf")
    drawable.fill = hover ? '#11a511' : '#000000'
    drawable.gravity = Magick::CenterGravity
    width = drawable.get_type_metrics(text)[3]

    icon = Magick::Image.new( width.ceil + 10 , 16) { self.background_color = '#FFFFFF' }
    drawable.annotate(icon, 0, 0, 0, 0, text)
    icon.write("#{RAILS_ROOT}/public/images/submenu/#{text}.png")
  end

end
