class Album < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
  belongs_to :language
  validates_presence_of :language

  index { name }

  # TODO - merge with documents!
  def self.find_filtered(country)
    if lang = Language.find_by_code(country)
      conditions = [ 'language_id = ?', lang.id ]
    end

    find(:all, :order => 'created_at DESC', :conditions => conditions)
  end


  def when
    happened_on || created_at
  end

  # TODO - fix missing photos and enable setting cover
  def cover
    photos.first
  end
  
  def picture
    cover.picture if cover
  end

  def summary
    "Contains #{photos.size} photos.<br/>"
  end

  def import_zip(f)
    Zip::ZipFile.open(f) do |zipfile|
      zipfile.each do |entry|
        if entry.file?      
          photo = Photo.new(:description => entry.name, :album => self)
          io = FakeFile.new(entry.name, zipfile.read(entry))
          photo.picture = io
          photo.save!
        else
          logger.warn "Ignoring zip entry '#{entry.name}' - not a file"
        end
      end
    end
  end

 class FakeFile < StringIO
    def initialize(name, data)
      @name = name
      super(data)
    end

    def original_filename
      @name
    end
  end

end
