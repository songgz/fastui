# encoding: utf-8

module Fastui
  class Tab

    @tabs ||= {}
    class << self
      attr_accessor :tabs
      def find(name)
        @tabs[name.to_s]
      end
    end

    attr_accessor :name, :title, :members

    #:opts => {members:[{:member => :title, :label => '标题'  },:note,:m_tabs]}
    def initialize(name,opts = {})
      self.name = name
      opts.each_pair do |k,v|
        self.send "#{k}=", v
      end
      self.class.tabs[name.to_s] = self
    end

  end
end
