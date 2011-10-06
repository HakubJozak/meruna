# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'config/initializers/pg_adapter_bugfix.rb'
require 'tasks/rails'

require 'rubygems'
# require 'texticle/tasks'

#  require 'sdoc' # and use your RDoc task the same way you used it before
# Rake::RDocTask.new do |rdoc|
#   rdoc.rdoc_dir = 'doc/rdoc'
#   rdoc.options << '--fmt' << 'shtml' # explictly set shtml generator
#   rdoc.template = 'direct' # lighter template used on railsapi.com
# end
