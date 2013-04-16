require_dependency "fastui/application_controller"

module Fastui
  class MViewsController < ApplicationController
    respond_to :html, :xml, :json
    def index

      @window = Fastui::Window.find(params[:name])
      #respond_with(@window.to_json(root: false,:include => { :tabs => {root:false}}))
      respond_with(@window.to_json())
    end

    def show
      @window = Fastui::Window.find(params[:id])
      respond_with(@window.to_json())
    end
  end
end
