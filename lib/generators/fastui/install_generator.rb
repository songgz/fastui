
module Fastui
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc "Fastui installation generator"

    def copy_config_file
      template "fastui_config.erb", "config/initializers/fastui_config.rb"
    end

    def copy_migrations
      rake("fastui:install:migrations")
    end

    def insert_engine_routes
      route %(
        mount Fastui::Engine => '/fastui'
      )
    end

    def remove_index_html
      remove_file 'public/index.html'
    end

    def show_readme
      readme '../USAGE'
    end

  end
end