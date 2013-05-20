require 'will_toggle/version'

module WillToggle
end

defined?(Rails::Railtie) ?
  require('will_toggle/railtie') :
  raise('will_toggle requires Rails::Railtie')