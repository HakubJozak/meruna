class Photo < ActiveRecord::Base
  enforce_schema_rules
  belongs_to :album

  validates_attachment_presence :picture
  validates_presence_of :album

  has_attached_file :picture, :styles => { :banner => [ "126x86", :png], :thumb => ["157x112",:png] }, :whiny => true
  index {  description; picture_file_name }

  def summary
    description
  end

  def name
    description
  end

  def when
    created_at
  end

  def to_label
    picture.original_filename
  end
end
