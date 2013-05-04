require 'will_toggle'

module ViewHelpers
  class Options
    
    attr_accessor :id 
    attr_accessor :label_text 
    attr_accessor :partial
    attr_accessor :locals
    attr_accessor :checked
    attr_accessor :clear_data
    
    def initialize options = {}
      self.id = options[:id]
      self.label_text = options[:label_text]
      self.partial = options[:partial]
      self.locals = options[:locals]
      self.checked = options[:checked]
      self.clear_data = options[:clear_data]
      set_defaults
    end
    
    def div_name
      "will-toggle-" << self.id
    end
    
    private
      def set_defaults
        self.checked ||= false
        self.clear_data ||= true
      end
  end
end