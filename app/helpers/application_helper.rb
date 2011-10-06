# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def country_filter
    unless params[:country].blank?
      params[:country]
    else
      'all'
    end
  end

  def localization_options
    links = country_selector('all', 'All')

    # FIXME - hack
    Language.all(:order => :code, :conditions => ["code != 'gb'"]).each do |lang|
      links += country_selector(lang.code, lang.name)
    end

    links
  end

  def country_selector(code, name)
    uri = "?country=#{code}"
    clazz = 'act' if country_filter == code

    content_tag(:a, :id=> code, :href => uri, :class => clazz) do
      content_tag(:span, name)
    end
  end


  # TODO - move to better location
  def icon( key, label = nil, options = {} )
    label ||=  I18n.translate(key)
    alt = label || key

    result  = image_tag("icons/#{key}.png",
                        :class => "icon",
                        :alt => alt,
                        :title => alt)
    result += " #{label}" unless options[:image_only]
    result
  end


  def cycle_with_first_last(object, collection, options = { })
    addition = ""
    addition += " #{options[:first]}" if object == collection.first
    addition += " #{options[:last]}"if object == collection.last
    cycle(options[:odd], options[:even]) + addition
  end

end
