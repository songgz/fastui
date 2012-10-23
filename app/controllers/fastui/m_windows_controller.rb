require_dependency "fastui/application_controller"

module Fastui
  class MWindowsController < ApplicationController
    respond_to :html,:xml,:json
    def index
        @m_windows = MWindow.all
        #@m_windows[:success] = true
        respond_with( {:success => true,:m_windows =>@m_windows})
    end

    def show
      @m_window = MWindow.includes(:m_tabs).find(params[:id])
      #p 'dsf'
      #p @m_window.m_tabs
      respond_with({:success => true,:m_windows =>@m_window})
    end
  end
end
