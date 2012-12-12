require_dependency "fastui/application_controller"

module Fastui
  class MDatatypesController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_datatypes = MDatatype.all
      respond_with(@m_datatypes.to_json(:include => [:m_entity,:org, :createdby, :updatedby]))
    end

    def show
      @m_datatype = MDatatype.find(params[:id])
      respond_with(@m_datatype)
    end

    def edit
      @m_datatype = MDatatype.find(params[:id])
      respond_with(@m_datatype)
    end

    def new
      @m_datatype = MDatatype.new
      respond_with(@m_datatype)
    end

    def create
      @m_datatype = MDatatype.new(params[:m_datatype])
      respond_with(@m_datatype) do |format|
        if @m_datatype.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_datatype = MDatatype.find(params[:id])

      respond_with(@m_datatype) do |format|
        if @m_datatype.update_attributes(params[:m_datatype])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_datatype = MDatatype.find(params[:id])
      @m_datatype.destroy
      respond_with(@m_datatype)
    end

  end
end