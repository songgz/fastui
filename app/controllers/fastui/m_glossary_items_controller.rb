require_dependency "fastui/application_controller"

module Fastui
  class MGlossaryItemsController < ApplicationController
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
      #@m_glossary_items = MGlossaryItem.where(conditions)
      @m_glossary_items = MGlossaryItem.where({:m_glossary_id => params[:m_glossary_id]}.delete_if {|k, v| v.blank? })
      respond_with(@m_glossary_items.to_json(:include =>[:m_glossary,:actived,:entity_kind,:org,:createdby,:updatedby]))
    end

    def show
      @m_glossary_item = MGlossaryItem.find(params[:id])
      respond_with(@m_glossary_item)
    end

    def edit
      @m_glossary_item = MGlossaryItem.find(params[:id])
      respond_with(@m_glossary_item)
    end

    def new
      @m_glossary_item = MGlossaryItem.new
      respond_with(@m_glossary_item)
    end

    def create
      @m_glossary_item = MGlossaryItem.new(params[:m_field])
      respond_with(@m_glossary_item) do |format|
        if @m_glossary_item.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_glossary_item = MGlossaryItem.find(params[:id])

      respond_with(@m_glossary_item) do |format|
        if @m_glossary_item.update_attributes(params[:m_field])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_glossary_item = MGlossaryItem.find(params[:id])
      @m_glossary_item.destroy
      respond_with(@m_glossary_item)
    end

  end
end