require 'test_helper'

class MenuIconsObserverTest < ActiveSupport::TestCase
  context "MenuIconsObserver" do
    setup do
      FileUtils.remove_dir(MenuIconsObserver.icons_path, true)
      FileUtils.mkdir_p(MenuIconsObserver.icons_path)
    end

    should "create icons when article is created" do
      a = Factory.create(:article, :key => 'dummy')
      [ "dummy.png", "dummy-hover.png" ].each do |file|
        assert File.exist?("#{MenuIconsObserver.icons_path}/#{file}"), "File #{file} does not exist"
      end
    end
  end
end
