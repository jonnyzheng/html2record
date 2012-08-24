$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "html2record/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "html2record"
  s.version     = Html2record::VERSION
  s.authors     = ["Jonny Zheng"]
  s.email       = ["mars131@gmail.com"]
  s.homepage    = "https://github.com/jonnyzheng/html2record"
  s.summary     = "convert html into activerecord "
  s.description = "convert html into activerecord "

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "nokogiri"

  s.add_development_dependency "mysql2"
  s.add_development_dependency "rspec","~> 2.0"
end
