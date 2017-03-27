# encoding: UTF-8

$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_blogit'
  s.version     = '0.0.12'

  s.summary     = "A mountable Rails blog for Rails applications, adapted for Spree Commerce"
  s.description = "Add a blog to your Spree Commerce application"

  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Edwin Horneij'
  s.email     = 'edwin@astekwallcovering.com'
  s.homepage  = 'http://www.designyourwall.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0.4'

  ###
  s.add_dependency "RedCloth", ">=4.2.9"
  s.add_dependency 'redcarpet', ">=2.0.1"
  s.add_dependency 'nokogiri', '>= 1.5.0'
  # TODO (breaking change): should be removed and added manually to project using it
  s.add_dependency "albino", ">=1.3.3"
  s.add_dependency "kaminari"
  s.add_dependency "jquery-rails"
  s.add_dependency "acts-as-taggable-on", "~> 3.5.0"

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  # s.add_development_dependency 'rspec-rails',  '~> 3.1'
  # s.add_development_dependency 'sass-rails', '~> 5.0.0.beta1'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'

  ###
  s.add_development_dependency "appraisal"
  s.add_development_dependency 'thor'
  s.add_development_dependency "yard"
  s.add_development_dependency "yard-tomdoc"
  # Debugging
  s.add_development_dependency "pry"

  # Databases
  # s.add_development_dependency "sqlite3"
  # s.add_development_dependency "mysql2"
  s.add_development_dependency "pg"

  # Testing
  s.add_development_dependency "codeclimate-test-reporter"
  s.add_development_dependency "spring", ">=1.3.6"
  s.add_development_dependency 'spring-commands-rspec'
  s.add_development_dependency "wwtd"

  s.add_development_dependency "autoprefixer-rails"
  s.add_development_dependency "rspec-rails", '~> 3.3.0'
  s.add_development_dependency "rspec-collection_matchers"
  s.add_development_dependency "rb-fsevent",  "~> 0.9.1" # OS X
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "growl"
  # s.add_development_dependency "factory_girl"
  s.add_development_dependency "mocha"
  s.add_development_dependency "sass"
  s.add_development_dependency "timecop"
end
