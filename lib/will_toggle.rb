require 'will_toggle/version'
require 'will_toggle/railtie' if defined?(Rails)
require 'view_helpers'

module WillToggle
  
  def will_toggle(toggle_options = {})
    return nil unless toggle_options[:partial]  # Nothing to toggle.
    
    opts = ViewHelpers::Options.new(toggle_options)
    
  end
  
  def insert_javascript
    <<-HTML
      <script type='text/javascript'>
        #{will_toggle_function}
        #{bind_will_toggle_function}
        #{set_initial_visibility_function }
      </script>
    HTML
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
