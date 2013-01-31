require 'will_toggle'

module WillToggle
  class Railtie < Rails::Railtie
    initializer "will_toggle" do |app|
      ActionView::Base.send :include, WillToggle
    end
  end
end