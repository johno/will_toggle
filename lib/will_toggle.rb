require 'will_toggle/version'
require 'will_toggle/railtie' if defined?(Rails)
require 'view_helpers'

module WillToggle
  
  class << self
    # Keep track of div numbers for jQuery selection.
    def next_div_number
      @div_number ||= 0
      @div_number += 1
    end
    
    def first_div?
      @div_number == 1
    end
  end
  
  def will_toggle toggle_options = {}
    return nil unless toggle_options[:partial]  # Nothing to toggle.
    
    toggle_options[:id] = WillToggle.next_div_number
    opts = ViewHelpers::Options.new toggle_options
    
    html = ''
    html = '<div class="field check-box">'
    html << check_box_tag(nil, nil, opts.checked, class: "form-input check-box will-toggle-check-box")
    html << label_tag(nil, opts.label_text)
    html << '</div>'
    html << "<div class='will-toggle-content' id='#{opts.div_name}'>"
    html <<   render(partial: opts.partial, locals: opts.locals)
    html << "</div>"
    html << insert_javascript
  end
  
  def insert_javascript
    "<script type='text/javascript'> \
      #{will_toggle_function if WillToggle.first_div? } \
      #{bind_will_toggle_function} \
      #{set_initial_visibility_function if WillToggle.first_div? }
    </script>"
  end
  
  def will_toggle_function
    <<-JS
      $.fn.willToggleDiv = function(div) {
        $(div).slideToggle(100)
                .find('input')
                  .val(null);
      }
    JS
  end
  
  def bind_will_toggle_function
    <<-JS
      $(window).ready(function() {
        $('.field').find('.will-toggle-check-box').change(function() {
          $().willToggleDiv($(this).parent().next());
        })
      });
    JS
  end
  
  def set_initial_visibility_function
    <<-JS
      $.fn.setInitialVisibility = function() {
        $('.field')
          .find('.will-toggle-check-box').each(function() {
            if($(this).attr('checked') != 'checked') { 
              $(this).parent().next().hide(); 
            }
        });
      }
      
      $(window).ready(function() { $().setInitialVisibility(); });
    JS
  end
end
