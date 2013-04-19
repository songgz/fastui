# encoding: utf-8
require 'singleton'
module Fastui
  class View
    include Singleton
    attr_accessor :version, :project, :copyright

    def initialize
      @project = 'Fastui Rapid Development Framework'
      @version = '2.0.0'
      @copyright = 'Copyright 2007-2013 ChunTeng Co., Ltd.'
    end


    def win(name, opts = {}, &block)
      Fastui::Window.new(name, opts, &block)
    end

    def tab(name, tab)
      Fastui::Tab.new(name, tab)
    end

    def config(&block)
      block.call(self) if block_given?
    end

    def find_window(name)
      Fastui::Window.find(name) || {}
    end
  end
end

