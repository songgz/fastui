require_dependency "fastui/application_controller"

module Fastui
  class MFieldsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_fields = MField.all
      respond_with(@m_fields)
    end

    def show
      @m_field = MField.find(params[:id])
      respond_with(@m_field)
    end

  end
end