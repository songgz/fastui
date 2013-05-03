$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fastui/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fastui"
  s.version     = Fastui::VERSION
  s.authors     = ["sgzhe"]
  s.email       = ["sgzhe@163.com"]
  s.homepage    = "https://github.com/songgz/fastui/wiki"
  s.summary     = "Fastui generates a UI from model for Rails."
  s.description = "FastUI is a framework for creating enterprise-level application style interfaces. Fastui is released as a Ruby Gem. The gem is to be installed within a Ruby on Rails 3 application."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  #s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "awesome_nested_set", "~> 2.1.5"
  s.add_dependency "bcrypt-ruby"

  s.add_development_dependency "mysql2"
end
