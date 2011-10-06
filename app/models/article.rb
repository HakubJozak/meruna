class Article < ActiveRecord::Base
  
  validates_uniqueness_of :key, :scope => :path
  index {  title; path; content; key }

  has_attached_file :image, :styles => { :medium => ["x300>",:png], :thumb => ["x100>",:png] }, :whiny => false  

  def self.find_by_pretty_name(options)
    raise 'Invalid pretty name specification' unless options.key?(:path) and options.key?(:key)
    Article.find(:first, :conditions => options)
  end

  def name
    "Article: #{title}"
  end

  def summary
    content
  end

end
