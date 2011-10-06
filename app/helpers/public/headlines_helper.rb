module Public::HeadlinesHelper

  def render_headlines
    result = ''
    classes = [ 'first', '', 'last' ]

    Headline.recent.each_with_index do |headline,i|
      result += render_headline(headline, classes[i] ) + "\n"
    end
    
    result
  end

  def render_headline(headline, class_extension)
    content_tag :div, :class => "newsBox #{class_extension}" do
      render :partial => 'public/headlines/headline', :object => headline
    end
  end

end
