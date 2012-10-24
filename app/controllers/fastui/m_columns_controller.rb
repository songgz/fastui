require_dependency "fastui/application_controller"

module Fastui
  class MColumnsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_columns = MColumn.all
      respond_with(@m_columns)
    end

    def show
      @m_column = MColumn.find(params[:id])
      respond_with(@m_column)
    end

  end
end