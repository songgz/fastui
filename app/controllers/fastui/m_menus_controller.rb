require_dependency "fastui/application_controller"

module Fastui
  class MMenusController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_menus = MMenu.all
      respond_with(@m_menus.to_json(:include => [:m_menu_items,:createdbyorg, :createdby, :updatedby]))
    end

    def show
      @m_menu = MMenu.find(params[:id])
      respond_with(@m_menu)
    end

    def edit
      @m_menu = MMenu.find(params[:id])
      respond_with(@m_menu.to_json(:include => [:createdbyorg, :createdby, :updatedby]))
    end

    def new
      @m_menu = MMenu.new
      respond_with(@m_menu)
    end

    def create
      @m_menu = MMenu.new(params[:m_menu])
      respond_with(@m_menu) do |format|
        if @m_menu.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_menu = MMenu.find(params[:id])

      respond_with(@m_menu) do |format|
        if @m_menu.update_attributes(params[:m_menu])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_menu = MMenu.find(params[:id])
      @m_menu.destroy
      respond_with(@m_menu)
    end

  end
end