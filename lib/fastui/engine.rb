require 'rails/all'
require 'fastui'

module Fastui
  class Engine < ::Rails::Engine
    isolate_namespace Fastui



    #initializer "fastui.add_middleware" do |app|
    #  app.middleware.use Fastui::Middleware
    #end
    #initializer "fastui precompile hook", :group => :all do |app|
    #  app.config.assets.precompile += ['fastui/fastui.js', 'fastui/fastui.css']
    #end
    #
    #initializer "static assets" do |app|
    #  app.middleware.insert_before ::Rack::Lock, ::ActionDispatch::Static, "#{root}/app/assets"
    #end

  end
end
