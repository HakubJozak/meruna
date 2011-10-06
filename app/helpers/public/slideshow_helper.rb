module Public::SlideshowHelper

  def slide(index, title, &block)
    slide = content_tag(:div, :id => "slide#{index}", :class => 'sl') do
      list = content_tag(:ul, :id => "slide#{index}l") {  capture(&block) }
      list + image_tag("/images/slideshow/slideshow-img#{index}.jpg", :alt => title, :size => '990x329' )
#      list + image_tag("slideshow/slideshow-img#{index}.jpg", :alt => title, :size => '990x329')
    end

    concat(slide)
  end

end
