class Banner < ActiveRecord::Base
  enforce_schema_rules
  validates_presence_of :link

  validates_attachment_presence :picture
  has_attached_file :picture, :styles => { :thumb => '157x122' }

  named_scope :published, :order => '"order" DESC'
end
