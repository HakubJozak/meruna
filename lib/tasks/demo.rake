namespace :db do
  desc "Create demo data in the current environment database"
  task :demo => [ :environment, :init_factories ] do
    5.times do
      Factory.create(:press_release)
      Factory.create(:pdf, :language => Language.first)
    end
  end

  desc "Smash current data"
  task :delete => [ :environment, :init_factories ] do
    PressRelease.delete_all
    Document.delete_all
  end

  task :init_factories do
    require "factory_girl"
    require "test/factories/documents_factory"
    require "test/factories/languages_factory"
    require "test/factories/press_releases_factory"
  end
  
  def r(n)
    1 + SecureRandom.random_number(n)
  end
end
