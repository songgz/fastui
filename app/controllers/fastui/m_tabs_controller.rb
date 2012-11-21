require_dependency "fastui/application_controller"

module Fastui
  class MTabsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_tabs = MTab.all
      respond_with(@m_tabs.to_json(:include => [:m_columns,:m_fields,:read,:actived,:entity_kind,:m_window,
      :m_entity,:org,:createdby,:updatedby]))
    end

    def show
      @m_tab = MTab.find(params[:id])
      p @m_tab.to_json(:include => [:m_columns,:m_fields])
      respond_with(@m_tab.to_json(:include => [:m_columns,:m_fields]))
    end

    def edit
      @m_tab = MTab.find(params[:id])
      respond_with(@m_tab)
    end

    def new
      @m_tab = MTab.new
      respond_with(@m_tab)
    end

    def create
      @m_tab = MTab.new(params[:m_tab])
      respond_with(@m_tab) do |format|
        if @m_tab.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_tab = MTab.find(params[:id])

      respond_with(@m_tab) do |format|
        if @m_tab.update_attributes(params[:m_tab])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_tab = MTab.find(params[:id])
      @m_tab.destroy
      respond_with(@m_tab)
    end

  end
end
