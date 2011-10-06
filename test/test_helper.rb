ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + '/../config/environment')
require 'test_help'

require 'factory_girl'
require 'shoulda'
require 'authlogic/test_case'
require 'webrat'
require 'mocha'
require 'fakeweb'
require 'lorem'



Webrat.configure do |config|
  config.mode = :rails
#  config.mode = :selenium
  config.application_framework = :rails
end



class ActiveSupport::TestCase
  include Authlogic::TestCase

  def login(name = nil)
    activate_authlogic
    user = Factory.create(:native_user, :login => (name || 'kuba'))
    UserSession.create(user)
  end

  def logout
    raise NotImplemented
  end

  def assert_download(filename)
    assert_equal @response.headers['Content-Disposition'], "attachment; filename=\"#{filename}\""
  end

  def assert_layout(layout)
    assert_equal "layouts/#{layout}", @response.layout
  end

  def self.active_scaffold_context(name)
    context "ActiveScaffold #{name}"  do
      setup do
        login
        get :index
      end

      should_be_active_scaffold

      if block_given?
        context ':' do
          yield binding
        end
      end
    end
  end

end


