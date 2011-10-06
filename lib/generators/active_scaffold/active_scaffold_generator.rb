class ActiveScaffoldGenerator < Rails::Generator::NamedBase
  def initialize(runtime_args, runtime_options = {})
    super
  end

  def manifest
    controller = @class_name.pluralize + 'Controller'    
    locals =  { :clazz => controller, :model => @class_name.constantize }

    record do |m|
      m.template 'active_scaffold.rb.erb', "app/controllers/admin/#{controller.underscore}.rb",  :assigns => locals
      m.template 'active_scaffold_test.rb.erb', "test/functional/admin/#{controller.underscore}_test.rb", :assigns => locals
    end
  end
end
