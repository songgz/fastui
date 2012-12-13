module Fastui
  class Env
    class << self
      @ctx = Ctx.new

      def getCtx
       @ctx
      end
    end
  end
end