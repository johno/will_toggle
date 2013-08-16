module WillToggle
  module ViewHelpers
    @@toggle_index ||= 0

    def will_toggle(options = {})
      attribute = nil
      generate_html(attribute, options).html_safe
    end
  
    def will_toggle_radio(options = {})
      @@toggle_index += 1
      generate_radio_html(options).html_safe
    end

    def generate_html(attribute, options = {})
      <<-HTML
        <div class='will-toggle-wrapper'>
          <div class='field check-box'>
            #{ get_check_box(attribute, options) }
          </div>
          <div class='will-toggle-content' id="will-toggle-#{ @@toggle_index }" style="display: #{ visibility(options[:checked]) };">
            #{ get_partial(options) }
          </div>
        </div>
      HTML
    end


    def generate_radio_html(options = {})
      <<-HTML
        <div class='will-toggle-wrapper'>
          <div class='field radio-button'>
            #{ get_radio_button(options) }
          </div>
          <div class='will-toggle-content' id="will-toggle-#{ @@toggle_index }" style="display: #{ visibility(options[:checked]) };">
            #{ get_partial(options) }
          </div>
        </div>
      HTML
    end
    
    def visibility(checked = false)
      checked ? :block : :none
    end
    
    def get_check_box(attribute, options = {})
      html = ''
      if attribute
        html << options[:form].check_box(attribute, onChange: js_call(options), class: 'check-box will-toggle-check-box')
        html << options[:form].label(attribute, options[:label])
      else
        html << check_box_tag(nil, nil, options[:checked], onChange: js_call(options), class: 'check-box will-toggle-check-box')
        html << label_tag(nil, options[:label], class: 'will-toggle-label')
      end
      html
    end

    def get_radio_button(options = {})
      html = ''
        html << radio_button_tag(options[:name], nil, options[:checked], onChange: js_radio_call(options[:name], options), class: 'check-box will-toggle-radio-button', value: options[:value])
        html << label_tag(nil, options[:label], class: 'will-toggle-label')
      html
    end

    
    def get_partial(options = {})
      render partial: options[:partial], 
             locals: options[:locals]
    end
    
    def js_call(options)
      "willToggle.toggleNext(\'#will-toggle-#{ @@toggle_index }\'#{ js_options(options) });".html_safe
    end

    def js_radio_call(name, options)
      "willToggle.toggleRadios(name, \'#will-toggle-#{ @@toggle_index }\'#{ js_options(options) });".html_safe
    end

    def js_options(options)
      " , #{ options[:clear_data] }" if options[:clear_data]
    end
  end
end