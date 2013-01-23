module Fastui
  class Window
    attr_accessor :name,:title
    def initialize(options = {})
      options.each_pair do |k,v|
        self.send "#{k}=", v
      end
    end
  end
end
