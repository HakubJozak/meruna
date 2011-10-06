class PressRelease < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true

  belongs_to :news_type
  validates_presence_of :title, :news_type

  named_scope :recent, :conditions => [ "released_at >= ?", 1.month.ago ]
end
