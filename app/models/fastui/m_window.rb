# encoding: utf-8
module Fastui
  class MWindow < ActiveRecord::Base
    attr_accessible :note, :title
    has_many :m_tabs, :dependent => :destroy
  end
end
