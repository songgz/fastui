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

    attr_accessor :name, :title, :entity, :readonly, :included_tab_id, :grid_kind, :form_kind, :members

    #:opts => {members:[{:member => :title, :title => '标题'  },:note,:m_tabs]}
    def initialize(name,opts = {})
      self.name = name
      opts.each_pair do |k,v|
        self.send "#{k}=", v
      end
      self.class.tabs[name.to_s] = self
    end

  end
end
