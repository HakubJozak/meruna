# Extract to plugin, gem or engine!
module Admin::BaseHelper

  def menu( title = nil, &block)
    if title
      label = content_tag :strong do
        image_tag('icons/folder.png') + title
      end
    end

    a = content_tag(:li, (label || ""))
    b = content_tag(:ul, capture( &block))

    concat(a + b)
  end

  def menu_item(key, link = nil)
    image = icon( key, I18n.t("menu.#{key}"))
    content_tag(:li, link_to_unless_current( image, link))
  end

  def model_menu_item(model, options = {})
    key = options[:key] || model.to_s.tableize
    link = options[:link] || send("admin_#{key}_path")
    label = options[:label] || icon( key, ActiveSupport::Inflector.pluralize(model.to_s) )
    content_tag(:li, link_to_unless_current( label, link))
  end

  def language_column(record)
    image_tag("flags/#{record.language.code}.png") if record.language
  end

end
