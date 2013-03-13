$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_search_log/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_search_log"
  s.version     = EnjuSearchLog::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["tanabe@mwr.mediacom.keio.ac.jp"]
  s.homepage    = "https://github.com/next-l/enju_search_log"
  s.summary     = "enju_search_log plugin"
  s.description = "Search log management for Next-L Enju"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/log/*"]

  s.add_dependency "rails", "~> 3.2"
  s.add_dependency "enju_biblio", "~> 0.1.0.pre23"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
end
