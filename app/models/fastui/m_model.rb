# encoding: utf-8

module Fastui
  class MModel

    def initialize(model)
      @model = model
    end

    def name
      @model.to_s
    end

    def columns
      @model.columns
    end

    def self.all
       @@models ||= ::ActiveRecord::Base.subclasses.map {|ar| MModel.new(ar)}
    end

    def self.find(class_name)
      all.detect {|m| m.class.to_s == class_name.to_s }
    end
  end
end
