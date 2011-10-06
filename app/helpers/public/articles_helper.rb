module Public::ArticlesHelper

  def profile_attribute(profile, attr)
    case attr
      when :homepage 
        render_links( profile.homepage)
      when :contact_email
        render_links( profile.contact_email, 'mailto:')
      else 
        profile.send(attr)
    end
  end

  private

  def render_links(links, prefix = '')
    links.split(',').map do |link|
      link_to(link, prefix + link, :popup => true)
    end.join(', ')
  end
end
