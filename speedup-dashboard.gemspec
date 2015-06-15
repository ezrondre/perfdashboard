$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "speedup-dashboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "speedup-dashboard"
  s.version     = SpeedupDashboard::VERSION
  s.authors     = ["Ondřej Ezr"]
  s.email       = ["ezrondre@fit.cvut.cz"]
  s.homepage    = "https://github.com/ezrondre/speedup-dashboard"
  s.summary     = "Performance dashboard is page, where performance of your rails app is pretty printed."
  s.description = "Performance dashboard creates an front-end for SpeedupRails gem and for now, there is proly no other use for it."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_dependency 'speedup-adapters'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'bootstrap_form'

  s.add_dependency 'groupdate'
  s.add_dependency 'chartkick'

  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
end
