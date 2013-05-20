require 'will_toggle'

module WillToggle
  module ViewHelpers
  
    class << self
      attr_accessor :toggle_options
    end
    
    self.toggle_options {
      checked: false,
      clear_data: false,
      locals: nil,
      partial: nil,
      label_text: nil
    }
  end
  
  def will_toggle(toggle_options = {})
    return nil unless toggle_options[:partial]  # Nothing to toggle.
    WillToggle::ViewHelpers.toggle_options.merge(toggle_options)
    generate_html(toggle_options).html_safe
  end
  
  def generate_html(toggle_options = {})
    <<-HTML
      <div class='will-toggle-wrapper'>
        <div class='field check-box'>
          #{ get_check_box(toggle_options) }
        </div>
        <div class='will-toggle-content'>
          #{ render partial: toggle_options[:partial], locals: toggle_options[:locals] }
        </div>
      </div>
    HTML
  end
  
  def get_check_box(toggle_options = {})
    if toggle_options[:map_to_attr] and toggle_options[:form]
      toggle_options[:form].check_box(toggle_options[:map_to_attr], onChange: "willToggle.toggleNext();", class: 'check-box')
      toggle_options[:form].label(toggle_options[:map_to_attr], toggle_options[:label])
    else
      check_box_tag(nil, nil, toggle_options[:checked], onChange: "willToggle.toggleNext();", class: 'check-box')
      label_tag(nil, toggle_options[:label])
    end
  end
end