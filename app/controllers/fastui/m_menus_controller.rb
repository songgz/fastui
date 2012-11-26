require_dependency "fastui/application_controller"

module Fastui
  class MMenusController < ApplicationController
    respond_to :html, :xml, :json
    def index
         @m_menus = MMenu.all
         respond_with(@m_menus.to_json(:include => [:m_menu_items,:actived,:entity_kind,
               :org,:createdby,:updatedby]))
    end

    def edit
          @m_menu = MMenu.find(params[:id])
              respond_with(@m_menu)
            end

  end
end