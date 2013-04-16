# encoding: utf-8
module Fastui
  class MWindow < MObject
    attr_accessible :window_kind

    has_many :m_tabs, :dependent => :destroy

    def tab_by(name)
      self.m_tabs.detect { |p| p.name == name }
    end


  end
end
