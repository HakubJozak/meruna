class ContentType < ActiveRecord::Base
  has_attached_file :icon, :styles => { :medium => ["x300>",:png], :thumb => ["x100>",:png] }
  validates_attachment_presence :icon
end
