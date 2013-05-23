# encoding: utf-8
require_dependency "fastui/application_controller"

module Fastui
  class MMenuItemsController < ApplicationController
    respond_to :html, :xml, :json

    def index
      @m_menu_items = params[:node] == '' ? MMenuItem.roots : MMenuItem.where({
                                                                                    :parent_id => params[:node]
                                                                                }.delete_if { |k, v| v.blank? })

      #if params[:id] == 'root'
      #  @m_menu_items = MMenuItem.roots
      #else
      #  @m_menu_items = MMenuItem.where({:parent_id => params[:id]}.delete_if { |k, v| v.blank?})
        #@m_menu_items = paginate(@items)
      #end
      respond_with(@m_menu_items.to_json(:include => [:m_menu, :createdbyorg, :createdby, :updatedby], :methods => [:leaf, :expanded]))
    end

    def show
      @m_menu_item = MMenuItem.find(params[:id])
      respond_with(@m_menu_item)
    end

    def edit
      @m_menu_item = MMenuItem.find(params[:id])
      respond_with(@m_menu_item.to_json(:include => [:m_menu, :createdbyorg, :createdby, :updatedby]))
    end

    def new
      @m_menu_item = MMenuItem.new
      respond_with(@m_menu_item)
    end

    def create
      @m_menu_item = MMenuItem.new(params[:m_menu_item])
      respond_with(@m_menu_item) do |format|
        if @m_menu_item.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_menu_item = MMenuItem.find(params[:id])

      respond_with(@m_menu_item) do |format|
        if @m_menu_item.update_attributes(params[:m_menu_item])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_menu_item = MMenuItem.find(params[:id])
      @m_menu_item.destroy
      respond_with(@m_menu_item)
    end


  end
end