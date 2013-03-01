require_dependency "fastui/application_controller"

module Fastui
  class MFieldsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_fields = MField.includes(:m_tab,:m_property,:createdbyorg,:createdby,:updatedby).where({
          :m_tab_id => params[:m_tab_id]}.delete_if {|k, v| v.blank? })
      data = paginate(@m_fields)
      respond_with(data.to_json(:include => [:m_tab,:m_property,:createdbyorg,:createdby,:updatedby]))
    end

    def show
      @m_field = MField.find(params[:id])
      respond_with(@m_field)
    end

    def edit
      @m_field = MField.find(params[:id])
      respond_with(@m_field.to_json(:include => [:m_tab,:m_property,:createdbyorg,:createdby,:updatedby]))
    end

    def new
      @m_field = MField.new
      respond_with(@m_field)
    end

    def create
      @m_field = MField.new(params[:m_field])
      respond_with(@m_field) do |format|
        if @m_field.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_field = MField.find(params[:id])

      respond_with(@m_field) do |format|
        if @m_field.update_attributes(params[:m_field])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_field = MField.find(params[:id])
      @m_field.destroy
      respond_with(@m_field)
    end

  end
end