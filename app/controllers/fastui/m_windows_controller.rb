require_dependency "fastui/application_controller"

module Fastui
  class MWindowsController < ApplicationController
    respond_to :html, :xml, :json

    def index
      @m_windows = MWindow.all
      respond_with(@m_windows.to_json(:include => [:org,:createdby,:updatedby]))
    end

    def show
      @m_window = MWindow.find(params[:id])
      p ActiveRecord::Base.subclasses
      respond_with(@m_window.to_json(:include =>
                                         {:m_tabs => {:include =>
                                                          {:m_fields => {:include =>
                                                                             {:m_property => {:include => [:refable]}}
                                                          },
                                                           :m_columns => {:include =>
                                                                              {:m_property => {:include => [:refable]}
                                                                              }
                                                           },
                                                           :m_entity => {:include => [:m_properties]}
                                                          }
                                         }
                                         }
                   )
      )
    end

    def edit
      @m_window = MWindow.find(params[:id])
      respond_with(@m_window.to_json(:include => [:org,:createdby,:updatedby]))
    end

    def new
      @m_window = MWindow.new
      respond_with(@m_window)
    end

    def create
      @m_window = MWindow.new(params[:m_window])
      respond_with(@m_window) do |format|
        if @m_window.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_window = MWindow.find(params[:id])

      respond_with(@m_window) do |format|
        if @m_window.update_attributes(params[:m_window])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_window = MWindow.find(params[:id])
      @m_window.destroy
      respond_with(@m_window)
    end
  end
end
