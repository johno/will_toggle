require 'will_toggle'

module WillToggle
  module ViewHelpers
  
    class << self
      attr_accessor :toggle_options
    end
  
    def will_toggle(attribute = nil, options = {})
      puts "!!!!!!!"
      puts attribute.inspect
      puts options.inspect
    
      WillToggle::ViewHelpers.toggle_options = options
      puts WillToggle::ViewHelpers.toggle_options
      generate_html(attribute).html_safe
    end
  
    def generate_html(attribute)
      puts 'GENERATE CALLED.'
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
  
    def get_check_box(attribute)
      if attribute
        WillToggle::ViewHelpers.toggle_options[:form].check_box(attribute, onChange: "willToggle.toggleNext();", class: 'check-box')
        WillToggle::ViewHelpers.toggle_options[:form].label(attribute, WillToggle::ViewHelpers.toggle_options[:label])
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
end