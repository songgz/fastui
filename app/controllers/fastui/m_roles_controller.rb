require_dependency "fastui/application_controller"

module Fastui
  class MRolesController < ApplicationController
    respond_to :html, :xml, :json

    def index        
      @m_roles = MRole.all
      data = paginate(MRole)
      respond_with(data.to_json({:include => :people,:methods => :person_ids}))
    end

    def show
      @m_role = MRole.find(params[:id])
      respond_with(@m_role)
    end

    def edit
      @m_role = MRole.find(params[:id])
      respond_with(@m_role.to_json({:include => :people,:methods => :person_ids}))
    end

    def new
      @m_role = MRole.new
      respond_with(@m_role)
    end

    def create
      @m_role = MRole.new(params[:m_role])
      respond_with(@m_role) do |format|
        if @m_role.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_role = MRole.find(params[:id])

      respond_with(@m_role) do |format|
        if @m_role.update_attributes(params[:m_role])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_role = MRole.find(params[:id])
      @m_role.destroy
      respond_with(@m_role)
    end



  end
end