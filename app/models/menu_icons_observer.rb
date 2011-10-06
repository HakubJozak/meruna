class MenuIconsObserver < ActiveRecord::Observer
  observe :article
  cattr_accessor :icons_path

  def after_save(article)
    MenuIconsObserver.draw_icon( article.title, article.key)
  end

  def self.draw_icon(text, filename)
    draw_icon_image(text, filename)
    draw_icon_image(text, filename, '-hover')
  end

  protected

  def self.draw_icon_image(text, filename, hover = nil)
    drawable = Magick::Draw.new
    drawable.pointsize = 14
    drawable.font = ("#{RAILS_ROOT}/db/fonts/BigSlabHammer_cz.ttf")
    drawable.fill = hover ? '#11a511' : '#000000'
    drawable.gravity = Magick::CenterGravity
    width = drawable.get_type_metrics(text)[3]

    icon = Magick::Image.new( width.ceil + 10 , 16) { self.background_color = '#FFFFFF' }
    drawable.annotate(icon, 0, 0, 0, 0, text)

    full_path = "#{MenuIconsObserver.icons_path}/#{filename}#{hover}.png"
    icon.write(full_path)
    Rails.logger.info("Updated icon '#{full_path}'")
  end

  # TODO - put into config
  def self.icons_path
    if Rails.env == 'test'
      "#{RAILS_ROOT}/test/generated"
    else
      "#{RAILS_ROOT}/public/images/submenu"
    end
  end

end
