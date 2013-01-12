require_dependency "fastui/application_controller"

module Fastui
  class MListsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_lists = MList.all
      respond_with(@m_lists.to_json(:include => [:m_list_items,:createdbyorg, :createdby, :updatedby]))
    end

    def show
      @m_list = MList.find(params[:id])
      respond_with(@m_list)
    end

    def edit
      @m_list = MList.find(params[:id])
      respond_with(@m_list)
    end

    def new
      @m_list = MList.new
      respond_with(@m_list)
    end

    def create
      @m_list = MList.new(params[:m_list])
      respond_with(@m_list) do |format|
        if @m_list.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_list = MList.find(params[:id])

      respond_with(@m_list) do |format|
        if @m_list.update_attributes(params[:m_list])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_list = MList.find(params[:id])
      @m_list.destroy
      respond_with(@m_list)
    end

  end
end