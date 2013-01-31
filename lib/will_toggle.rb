require "will_toggle/version"
require 'will_toggle/railtie' if defined?(Rails)


module WillToggle
  
  class << self
    # Keep track of div numbers for jQuery selection.
    def next_div_number
      @div_number ||= 0
      @div_number += 1
    end
  end
  
  def will_toggle label_name, checked=false, toggle = {}
    return nil unless toggle[:partial]  # Nothing to toggle.
    
    html = "<div class='will-toggle-#{WillToggle.next_div_number}'>"
    html <<   render(partial: toggle[:partial], locals: toggle[:locals])
    html << "</div>"
  end
end
