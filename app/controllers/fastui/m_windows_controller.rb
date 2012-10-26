require_dependency "fastui/application_controller"

module Fastui
  class MWindowsController < ApplicationController
    respond_to :html,:xml,:json
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
      respond_with(@m_window.to_json(:include =>{:m_tabs =>{:include =>{:m_fields=>{},:m_columns=>{}}}}))
    end

    def create
      @m_window = MWindow.new(params[:m_window])
      @m_window.save
    end
  end
end
