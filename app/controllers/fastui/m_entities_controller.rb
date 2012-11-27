require_dependency "fastui/application_controller"

module Fastui
  class MEntitiesController < ApplicationController
    respond_to :html, :xml, :json

    def index
      @m_entities = MEntity.all
      respond_with(@m_entities.to_json(:include => [:m_properties, :access_level, :actived, :entity_kind,
                                                    :org, :createdby, :updatedby]))
    end

    def show
      @m_entity = MEntity.find(params[:id])
      respond_with(@m_entity)
    end

    def edit
      @m_entity = MEntity.find(params[:id])
      respond_with(@m_entity.to_json(:include => [:org, :createdby, :updatedby]))
    end

    def new
      @m_entity = MEntity.new
      respond_with(@m_entity)
    end

    def create
      @m_entity = MEntity.new(params[:m_entity])
      respond_with(@m_entity) do |format|
        if @m_entity.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_entity = MEntity.find(params[:id])

      respond_with(@m_entity) do |format|
        if @m_entity.update_attributes(params[:m_entity])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_entity = MEntity.find(params[:id])
      @m_entity.destroy
      respond_with(@m_entity)
    end

  end
end