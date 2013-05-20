# -*- encoding: utf-8 -*-
require File.expand_path('../lib/will_toggle/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["johnotander"]
  gem.email         = ["johnotander@gmail.com"]
  gem.description   = %q{This gem will toggle page content, based on the current state of a check button.}
  gem.summary       = %q{Will toggle page content.}
  gem.homepage      = ""

  gem.files         = Dir['{lib|spec}/**/*']
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "will_toggle"
  gem.require_paths = ["lib"]
  gem.version       = WillToggle::VERSION
  
  gem.add_dependency "rails"
  gem.add_dependency "jquery-rails"
end
