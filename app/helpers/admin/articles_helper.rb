module Admin::ArticlesHelper
  def image_column(article)
    if article.image.exists?
      article.image.url
    else
      ''
    end
  end
end
