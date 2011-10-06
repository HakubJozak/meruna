require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  context "Album" do
    setup do
      @album = Factory.create(:album)
    end

    should 'import photos from zip file' do
      @album.import_zip("#{RAILS_ROOT}/test/factories/data/album.zip")
      assert_equal 3, @album.photos.size
    end
  end
end
