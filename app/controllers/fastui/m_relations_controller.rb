require_dependency "fastui/application_controller"

module Fastui
  class MRelationsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_relations = MRelation.scoped
      data = paginate(@m_relations)
      respond_with(data.to_json(:include => [:m_entity,:createdbyorg, :createdby, :updatedby]))
    end

    def show
      @m_relation = MRelation.find(params[:id])
      respond_with(@m_relation)
    end

    def edit
      @m_relation = MRelation.find(params[:id])
      respond_with(@m_relation.to_json(:include => [:m_entity,:createdbyorg, :createdby, :updatedby]))
    end

    def new
      @m_relation = MRelation.new
      respond_with(@m_relation)
    end

    def create
      @m_relation = MRelation.new(params[:m_relation])
      respond_with(@m_relation) do |format|
        if @m_relation.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_relation = MRelation.find(params[:id])

      respond_with(@m_relation) do |format|
        if @m_relation.update_attributes(params[:m_relation])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_relation = MRelation.find(params[:id])
      @m_relation.destroy
      respond_with(@m_relation)
    end

  end
end