class Document < ActiveRecord::Base
  enforce_schema_rules
  belongs_to :language
  belongs_to :document_type

  validates_attachment_presence :file
  validates_presence_of :document_type

  has_attached_file :file, :styles => { :medium => ["x300>",:png], :thumb => ["x100>",:png] }, :whiny => false

  # TODO - merge with albums!
  def self.find_filtered(country)
    if lang = Language.find_by_code(country)
      conditions = [ 'language_id = ?', lang.id ]
    end

    find(:all, :order => 'created_at DESC', :conditions => conditions)
  end

end
