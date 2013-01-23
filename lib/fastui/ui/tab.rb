module Fastui
  class Tab
    attr_accessor :name,:title,:entity
    def initialize(options = {})
      options.each_pair do |k,v|
        self.send "#{k}=", v
      end
    end

  end
end
