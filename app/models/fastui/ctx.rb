module Fastui
  class Ctx
    def initialize
      @data = {}
    end

    def set(key,value)
      @data[key.to_s] = value
    end

    def get(key)
      @data[key]
    end
  end
end
