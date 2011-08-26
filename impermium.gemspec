# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "impermium/version"

Gem::Specification.new do |s|
  s.name        = "impermium"
  s.version     = Impermium::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bosko Ivanisevic"]
  s.email       = ["bosko.ivanisevic@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Impermium API wrapper}
  s.description = %q{Impermium API wrapper}

  s.add_dependency "faraday", "~> 0.7.4"
  s.add_dependency "faraday_middleware", "~> 0.7.0"
  s.add_dependency "hashie", "~> 1.1.0"

  s.add_development_dependency "rspec", "~> 2.6"
 
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
