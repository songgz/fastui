# encoding: utf-8
require 'singleton'
module Fastui
  class View
    include Singleton

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

