$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_search_log/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_search_log"
  s.version     = EnjuSearchLog::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["nabeta@fastmail.fm"]
  s.homepage    = "https://github.com/next-l/enju_search_log"
  s.summary     = "enju_search_log plugin"
  s.description = "Search log management for Next-L Enju"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/log/*"] - Dir["spec/dummy/solr/{data,pids,default,development,test}/*"] - Dir["spec/dummy/tmp/*"] - Dir["spec/dummy/db/*.sqlite3"]

  s.add_dependency "enju_leaf", "~> 1.3.4.rc.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "mysql2"
  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails", "~> 4.0"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "sunspot_solr", "~> 2.5"
  s.add_development_dependency "rspec-activemodel-mocks"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "coveralls", "~> 0.8.23"
  s.add_development_dependency "annotate"
  s.add_development_dependency "rails", "~> 5.2"
  s.add_development_dependency "sprockets", "~> 3.7"
end
