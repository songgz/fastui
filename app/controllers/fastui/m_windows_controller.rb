require_dependency "fastui/application_controller"

module Fastui
  class MWindowsController < ApplicationController
    respond_to :html, :xml, :json

    def index
      @m_windows = MWindow.all
      #@m_windows[:success] = true
      #respond_with( {:success => true,:m_windows =>@m_windows})
      respond_with(@m_windows)
    end

    def show
      @m_window = MWindow.find(params[:id])
      #p 'dsf'
      #p @m_window.m_tabs
      #respond_with({:success => true,:m_windows =>@m_window})
      #respond_with(@m_window.to_json(:include => :m_tabs))
      #p @m_window.to_json(:include =>{:m_tabs =>{:include =>{:m_fields=>{},:m_columns=>{}}}})
      p ActiveRecord::Base.subclasses
      respond_with(@m_window.to_json(:include => {:m_tabs => {:include => {:m_fields => {}, :m_columns => {}}}}))
    end

    def edit
      @m_window = MWindow.find(params[:id])
      p @m_window
      respond_with(@m_window)
    end

    def new
      #@m_window = MWindow.new
      #
      #respond_to do |format|
      #  format.html # new.html.erb
      #  format.xml  { render :xml => @m_window }
      #  format.json  { render :json => @m_window.to_json() }
      #end
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
          #format.html { redirect_to(@m_window) }
          #format.xml  { head :ok }
          format.json  { render :json =>{:success => true, :msg => 'ok'}}
        else
          #format.html { render :action => "edit" }
          #format.xml  { render :xml => @m_window.errors, :status => :unprocessable_entity }
          format.json  { render :json => {:success => false, :msg => 'false'}}
        end
      end
    end

    def destroy
      #@m_window = MWindow.find_by_id(params[:id])
      #@m_window.destroy
      #
      #respond_to do |format|
      #  format.html { redirect_to(m_window_url) }
      #  format.xml  { head :ok }
      #  format.json  { render :json =>{:success => true, :msg => 'ok'}}
      #end
    end


  end
end
