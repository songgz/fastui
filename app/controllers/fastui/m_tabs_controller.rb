require_dependency "fastui/application_controller"

module Fastui
  class MTabsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_tabs = MTab.all
      respond_with(@m_tabs)
    end

    def show
      @m_tab = MTab.find(params[:id])
      respond_with(@m_tab)
    end

  end
end
