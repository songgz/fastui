# encoding: utf-8
require_dependency "fastui/application_controller"

module Fastui
  class MHelpsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_helps = MHelp.where({
                                 :name => params[:name]
                             }.delete_if {|k, v| v.blank? })
      data = paginate(@m_helps)
      respond_with(data.to_json())
    end

    def show
      @m_help = MHelp.find(params[:id])
      respond_with(@m_help)
    end

    def edit
      @m_help = MHelp.find(params[:id])
      respond_with(@m_help)
    end

    def new
      @m_help = MHelp.new
      respond_with(@m_help)
    end

    def create
      @m_help = MHelp.new(params[:m_help])
      respond_with(@m_help) do |format|
        if @m_help.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_help = MHelp.find(params[:id])

      respond_with(@m_help) do |format|
        if @m_help.update_attributes(params[:m_help])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_help = MHelp.find(params[:id])
      @m_help.destroy
      respond_with(@m_help)
    end

  end
end
