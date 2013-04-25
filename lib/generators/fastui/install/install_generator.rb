require 'rails/generators'
module Fastui
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :config_name, :type => :string, :default => "fastui"

    desc "Now you'll create an fastui_config file..."
    def copy_config_file

      template "fastui_config.erb", "config/initializers/fastui_config.rb"
    end
  end
end