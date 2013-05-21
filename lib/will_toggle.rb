require 'will_toggle/version'
require 'will_toggle/engine'
require 'view_helpers'

module WillToggle
  include ViewHelpers
end

defined?(Rails::Railtie) ?
  require('will_toggle/railtie') :
  raise('will_toggle requires Rails::Railtie')