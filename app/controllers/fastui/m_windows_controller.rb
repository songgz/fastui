require_dependency "fastui/application_controller"

module Fastui
  class MWindowsController < ApplicationController
    def index
        @m_windows = MWindow.all
        data  ={
            :results => @m_windows.length,
            :rows => @m_windows
        }
         p data
        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @m_windows }
          format.json  { render :json => data.to_json(:include => :m_tabs) }
        end
    end
  end
end
