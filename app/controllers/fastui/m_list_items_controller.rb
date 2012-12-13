require_dependency "fastui/application_controller"

module Fastui
  class MListItemsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      #conditions = {}
      #unless params[:filter].blank?
      #JSON.parse(params[:filter]).each do |filter|
      #  conditions[filter['property']] = filter['value']
      #end
      #end
      #unless params[:m_glossary_id].blank?
      #  conditions[:m_glossary_id] = params[:m_glossary_id]
      #end
      #
      #@m_list_items = MListItem.where(conditions)
      @m_list_items = MListItem.where({:m_list_id => params[:m_list_id]}.delete_if {|k, v| v.blank? })
      respond_with(@m_list_items.to_json(:include =>[:m_list,:org,:createdby,:updatedby]))
    end

    def show
      @m_list_item = MListItem.find(params[:id])
      respond_with(@m_list_item)
    end

    def edit
      @m_list_item = MListItem.find(params[:id])
      respond_with(@m_list_item)
    end

    def new
      @m_list_item = MListItem.new
      respond_with(@m_list_item)
    end

    def create
      @m_list_item = MListItem.new(params[:m_list_item])
      respond_with(@m_list_item) do |format|
        if @m_list_item.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_list_item = MListItem.find(params[:id])

      respond_with(@m_list_item) do |format|
        if @m_list_item.update_attributes(params[:m_list_item])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_list_item = MListItem.find(params[:id])
      @m_list_item.destroy
      respond_with(@m_list_item)
    end

  end
end