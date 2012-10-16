module Fastui
  class MModel
    def initialize(model)
      @model = model
    end
    def self.all
      #ActiveRecord::Base
      subclasss.each do |s|
        @@models << MModel.new(s)
      end
      return @@models
    end

    def attrs
      @model.attributes
    end

  end
end
