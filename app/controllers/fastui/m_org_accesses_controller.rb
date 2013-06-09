require_dependency "fastui/application_controller"

module Fastui
  class MOrgAccessesController < ApplicationController
    respond_to :html, :xml, :json

    def index
      @m_org_accesses = MOrgAccess.where({
                                             :m_role_id => params[:m_role_id]
                                         }.delete_if {|k, v| v.blank? })
      data = paginate(@m_org_accesses)
      respond_with(data.to_json({:include => [:m_org, :m_role]}))
    end

    def show
      @m_org_access = MOrgAccess.find(params[:id])
      respond_with(@m_org_access)
    end

    def edit
      @m_org_access = MOrgAccess.find(params[:id])
      respond_with(@m_org_access.to_json({:include => [:m_org, :m_role]}))
    end

    def new
      @m_org_access = MOrgAccess.new
      respond_with(@m_org_access)
    end

    def create
      @m_org_access = MOrgAccess.new(params[:m_org_access])
      respond_with(@m_org_access) do |format|
        if @m_org_access.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_org_access = MOrgAccess.find(params[:id])
      respond_with(@m_org_access) do |format|
        if @m_org_access.update_attributes(params[:m_org_access])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_org_access = MOrgAccess.find(params[:id])
      @m_org_access.destroy
      respond_with(@m_org_access)
    end

  end
end
