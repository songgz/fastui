# encoding: utf-8
module Fastui
  class MWindow < MObject
    attr_accessible :window_kind

    has_many :m_tabs, :dependent => :destroy
  end
end
