module Fastui
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      def copy_config_file
        display "Now you'll create an fastui_config file..."
        template "fastui_config.erb", "fastui/initializers/fastui_config.rb"
      end
    end
end
