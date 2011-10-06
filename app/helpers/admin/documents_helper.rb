module Admin::DocumentsHelper

  def created_at_column(record)
    time_ago_in_words(record.created_at) + ' ago'
  end

  def thumb_column(doc)
    path = doc.file.path(:thumb)
    
    if path and File.exist?(path)
      image_tag( doc.file.url(:thumb), :class => 'thumb')
    else
      "No thumbnail"
    end

  end
end
