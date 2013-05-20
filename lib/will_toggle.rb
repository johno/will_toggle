require 'will_toggle/version'
require 'will_toggle/view_helpers'

module WillToggle
end

defined?(Rails::Railtie) ?
  require('will_toggle/railtie') :
  raise('will_toggle requires Rails::Railtie')