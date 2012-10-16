require_dependency "fastui/application_controller"

module Fastui
  class MWindowsController < ApplicationController
    def index
        @m_windows = MWindow.all

        respond_to do |format|
          format.json { render :json => { :m_windows => @m_windows } }
        end
    end
  end
end
