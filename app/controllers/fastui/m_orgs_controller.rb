require_dependency "fastui/application_controller"

module Fastui
  class MOrgsController < ApplicationController
    respond_to :html, :xml, :json

    def index
      #@m_orgs = MOrg.scoped
      @m_orgs = params[:node] == '' ? MOrg.roots : MOrg.where({
                                                                    :parent_id => params[:node]
                                                                }.delete_if { |k, v| v.blank? })

      respond_with(@m_orgs.to_json(:include => [:parent], :methods => [:leaf, :expanded]))
    end

    def show
      @m_org = MOrg.find(params[:id])
      respond_with(@m_org)
    end

    def edit
      @m_org = MOrg.find(params[:id])
      respond_with(@m_org.to_json(:include => [:parent]))
    end

    def new
      @m_org = MOrg.new
      respond_with(@m_org)
    end

    def create
      @m_org = MOrg.new(params[:m_org])
      respond_with(@m_org) do |format|
        if @m_org.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_org = MOrg.find(params[:id])

      respond_with(@m_org) do |format|
        if @m_org.update_attributes(params[:m_org])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_org = MOrg.find(params[:id])
      @m_org.destroy
      respond_with(@m_org)
    end

  end
end