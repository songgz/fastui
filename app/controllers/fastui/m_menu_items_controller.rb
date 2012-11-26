require_dependency "fastui/application_controller"

module Fastui
  class MMenuItemsController < ApplicationController
    respond_to :html, :xml, :json
    def index
         @m_menu_items = params[:id] == 'root' ? MMenuItem.roots : MMenuItem.where({
                                             :parent_id => params[:id]
                                         }.delete_if {|k, v| v.blank? })
         respond_with(@m_menu_items)
    end

  end
end