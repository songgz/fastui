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

      p @m_tab.to_json(:include => [:m_columns,:m_fields])

      respond_with(@m_tab.to_json(:include => [:m_columns,:m_fields]))
    end

  end
end
