$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "perfdashboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "perfdashboard"
  s.version     = Perfdashboard::VERSION
  s.authors     = ["Ondřej Ezr"]
  s.email       = ["ezrondre@fit.cvut.cz"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Perfdashboard."
  s.description = "TODO: Description of Perfdashboard."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_dependency 'httparty'
  s.add_dependency 'bootstrap-sass'

  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
end
