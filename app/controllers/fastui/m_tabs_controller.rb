require_dependency "fastui/application_controller"

module Fastui
  class MTabsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      #@m_tabs = MTab.where(:m_window_id => 2)
      @m_tabs = MTab.all
      #respond_with(@m_tabs)
      #respond_with({:success => true,:m_tabs =>@m_tabs})
      respond_with(@m_tabs)
    end

    def show
      @m_tab = MTab.find(params[:id])
      respond_with(@m_tab)
    end


  end
end
