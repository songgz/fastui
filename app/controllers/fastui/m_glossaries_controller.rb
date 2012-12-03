require_dependency "fastui/application_controller"

module Fastui
  class MGlossariesController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_glossaries = MGlossary.all
      respond_with(@m_glossaries.to_json(:include => [:m_glossary_items,:actived, :entity_kind,:org, :createdby, :updatedby]))
    end

    def show
      @m_glossary = MGlossary.find(params[:id])
      respond_with(@m_glossary)
    end

    def edit
      @m_glossary = MGlossary.find(params[:id])
      respond_with(@m_glossary)
    end

    def new
      @m_glossary = MGlossary.new
      respond_with(@m_glossary)
    end

    def create
      @m_glossary = MGlossary.new(params[:m_field])
      respond_with(@m_glossary) do |format|
        if @m_glossary.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_glossary = MGlossary.find(params[:id])

      respond_with(@m_glossary) do |format|
        if @m_glossary.update_attributes(params[:m_field])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_glossary = MGlossary.find(params[:id])
      @m_glossary.destroy
      respond_with(@m_glossary)
    end

  end
end