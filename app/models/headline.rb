class Headline < ActiveRecord::Base
  enforce_schema_rules

  index { title; short; long }

  has_attached_file :image, :styles => { :medium => ["x300>",:png], :thumb => ["x100>",:png] }, :whiny => false
  
  has_friendly_id :title, :use_slug => true
  belongs_to :news_type
  validates_presence_of :news_type

  default_scope :order => 'created_at DESC'
  named_scope :recent, :limit => 3


  def name
    "News: #{title}"
  end

  def summary
    short
  end

  def picture
    news_type.icon
  end

end
