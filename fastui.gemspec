$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fastui/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fastui"
  s.version     = Fastui::VERSION
  s.authors     = ["sgzhe"]
  s.email       = ["sgzhe@163.com"]
  s.homepage    = ""
  s.summary     = "Fastui generates a UI from model."
  s.description = "Fastui generates a UI from model."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "awesome_nested_set", "~> 2.1.5"

  s.add_dependency "mysql2"
end
