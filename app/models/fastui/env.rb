module Fastui
  class Env
    @ctx = Ctx.new
    class << self
      attr_reader :ctx
      def set(key,value)
        @ctx.set(key,value)
      end

      def get(key)
        @ctx.get(key)
      end
    end

  end
end