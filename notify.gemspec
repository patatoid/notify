$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "notify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "notify"
  s.version     = Notify::VERSION
  s.authors     = ["Pascal Knoth"]
  s.email       = ["pascal@knoth.fr"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Notify."
  s.description = "TODO: Description of Notify."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency "devise"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl"
end
