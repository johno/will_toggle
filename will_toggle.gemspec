# -*- encoding: utf-8 -*-
require File.expand_path('../lib/will_toggle/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "will_toggle"
  gem.authors       = ["John Otander"]
  gem.email         = ["johnotander@gmail.com"]
  gem.description   = %q{This gem will toggle page content, based on the current state of a check button.}
  gem.summary       = %q{Will toggle page content.}
  gem.homepage      = "https://github.com/johnotander/will_toggle"
  gem.version       = WillToggle::VERSION
  gem.license       = "MIT"
  
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "rails"
  gem.add_dependency "jquery-rails"
  
  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
end
