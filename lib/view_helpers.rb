require 'will_toggle'

module WillToggle
  module ViewHelpers
  
    class << self
      attr_accessor :toggle_options
    end
    
    self.toggle_options = {
      checked: false,
      clear_data: false,
      locals: nil,
      partial: nil,
      label_text: nil
    }
  end
  
  def will_toggle(attribute = nil, toggle_options = {})
    puts "!!!!!!!"
    puts attribute.inspect
    puts toggle_options.inspect
    return nil unless toggle_options[:partial]  # Nothing to toggle.
    
    WillToggle::ViewHelpers.toggle_options.merge(toggle_options)
    generate_html(toggle_options).html_safe
  end
  
  def generate_html(toggle_options = {})
    <<-HTML
      <div class='will-toggle-wrapper'>
        <div class='field check-box'>
          #{ get_check_box(attribute) }
        </div>
        <div class='will-toggle-content'>
          #{ get_partial }
        </div>
      </div>
    HTML
  end
  
  def get_check_box(attribute = nil)
    if attribute
      toggle_options[:form].check_box(attribute, onChange: "willToggle.toggleNext();", class: 'check-box')
      toggle_options[:form].label(attribute, WillToggle::ViewHelpers.toggle_options[:label])
    else
      check_box_tag(nil, nil, WillToggle::ViewHelpers.toggle_options[:checked], onChange: "willToggle.toggleNext();", class: 'check-box')
      label_tag(nil, WillToggle::ViewHelpers.toggle_options[:label])
    end
  end
  
  def get_partial
    render partial: WillToggle::ViewHelpers.toggle_options[:partial], 
           locals: WillToggle::ViewHelpers.toggle_options[:locals]
  end
end