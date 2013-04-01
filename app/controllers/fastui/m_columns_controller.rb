require_dependency "fastui/application_controller"

module Fastui
  class MColumnsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_columns = MColumn.includes(:m_tab, :m_property,:createdbyorg,:createdby,:updatedby).where({
      :m_tab_id => params[:m_tab_id]}.delete_if {|k, v| v.blank? })
      @records = @m_columns.page(params[:page]).per(6)
      data ={
          :totalCount => @m_columns.length,
          :rows => @records
      }
      #data = paginate(@m_columns)
      respond_with(data.to_json(:include => [:m_tab, :m_property,:createdbyorg,:createdby,:updatedby]))
    end

    def show
      @m_column = MColumn.find(params[:id])
      respond_with(@m_column)
    end

    def edit
      @m_column = MColumn.find(params[:id])
      respond_with(@m_column.to_json(:include => [:m_tab,:m_property,:createdbyorg,:createdby,:updatedby]))
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