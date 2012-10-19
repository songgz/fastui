require_dependency "fastui/application_controller"

module Fastui
  class MWindowsController < ApplicationController
    respond_to :html,:xml,:json
    def index
        @m_windows = MWindow.all
        respond_with(@m_windows)
    end

    def show
      @m_window = MWindow.find(params[:id])
      #p 'sdfdfs'
      #p @m_window.to_json
      respond_with(@m_window)
    end
  end
end
