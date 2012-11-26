require_dependency "fastui/application_controller"

module Fastui
  class MPropertiesController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_properties = MProperty.all
      respond_with(@m_properties.to_json(:include => [:m_entity, :actived, :entity_kind,
                                                     :org, :createdby, :updatedby]))
    end

    def show
      @m_property = MProperty.find(params[:id])
      respond_with(@m_property)
    end

    def edit
      @m_property = MProperty.find(params[:id])
      respond_with(@m_property)
    end

    def new
      @m_property = MProperty.new
      respond_with(@m_property)
    end

    def create
      @m_property = MProperty.new(params[:m_field])
      respond_with(@m_property) do |format|
        if @m_property.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_property = MProperty.find(params[:id])

      respond_with(@m_property) do |format|
        if @m_property.update_attributes(params[:m_field])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_property = MProperty.find(params[:id])
      @m_property.destroy
      respond_with(@m_property)
    end

  end
end