require 'test_helper'

class Admin::BaseHelperTest < ActionView::TestCase

  def setup
    Admin::BaseHelper.class_eval("include ApplicationHelper")
  end

  def test_menu
    icon = '<img alt="Folder" src="/images/icons/folder.png" />'
    assert_equal "<li><strong>#{icon}title</strong></li><ul>in</ul>", menu("title") { "in"}
  end

  def test_menu_item
    expected = '<li><a href="/admin/users"><img alt="Users" ' +
               'class="icon" src="/images/icons/users.png" title="Users" /> Users</a></li>'

    assert_equal expected, model_menu_item(User)
  end

  test "model menu item with press release" do
    assert_match /.*press_releases.*/, model_menu_item(PressRelease)
  end

end
