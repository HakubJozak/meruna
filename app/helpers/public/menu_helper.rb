module Public::MenuHelper

  # TODO - preloader
  # <div id="preloader">
  #   <img src="http://domain.tld/path/images/01.png" width="1" height="1" />
  # </div>
  def main_menu
    items = [
      [ 'highlights', :news, :albums, article('calendar') ], #[ 'news', 'photos', 'videos', 'calendar' ],
      [ 'about-us', article('project') , :organizers, article('african-partners'), article('european-partners') ],
      [ 'documents', 'press_releases', :downloads, article('development-faq') ],
      [ 'play-with-us', article('join-us-schools'), article('join-us-students'), article('newsletter') ]
    ]

    current_key = find_current_item(items.map { |i| i.first })
   
    # main menu
    m = content_tag(:div, :id => 'menu') do
      items.map do |item|
        key = item.first
        clazz = (key == current_key) ? 'act' : ''
        link_to content_tag(:span, key), category_path(:path => key.to_s), :id => key, :class => clazz
      end.join("\n")
    end

    # submenu
    s = content_tag(:div, :id => 'submenu') do
      submenu(items.assoc(current_key))
    end

    m + s
  end


  def submenu(items)
    items.map { |item| submenu_item(item) }.join("\n")
  end
  
  def submenu_item(target)
    if Symbol === target
      image = image_tag("submenu/#{target.to_s}.png", :alt => target.to_s.humanize )
      link_to( image, send("public_#{target.to_s}_url") )
    elsif Article === target
      image = image_tag("submenu/#{target.key}.png", :alt => target.title)
      link_to( image, named_article_url( :path => target.path, :key => target.key))
    elsif String === target
      '' # target
    end
  end

  private

  def find_current_item(items)
    uri = self.request.path_info      
    selected = items.select { |item| uri.starts_with("/#{item}") }
    selected.first || items.first
  end

  def article(key)
    Article.find_by_key(key)
  end 

end
