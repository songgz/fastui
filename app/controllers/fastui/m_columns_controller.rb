require_dependency "fastui/application_controller"

module Fastui
  class MColumnsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_columns = MColumn.all
      respond_with(@m_columns)
    end

    def show
      @m_column = MColumn.find(params[:id])
      respond_with(@m_column)
    end

    def edit
      @m_column = MColumn.find(params[:id])
      respond_with(@m_column)
    end

    def new
      @m_column = MColumn.new
      respond_with(@m_column)
    end

    def create
      @m_column = MColumn.new(params[:m_column])
      respond_with(@m_column) do |format|
        if @m_column.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_column = MColumn.find(params[:id])

      respond_with(@m_column) do |format|
        if @m_column.update_attributes(params[:m_column])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_column = MColumn.find(params[:id])
      @m_column.destroy
      respond_with(@m_column)
    end

  end
end