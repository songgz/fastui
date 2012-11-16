require_dependency "fastui/application_controller"

module Fastui
  class MPersonsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_people = MPerson.all
      respond_with(@m_people)
    end

    def show
      @m_person = MPerson.find(params[:id])
      respond_with(@m_person)
    end

    def edit
      @m_person = MPerson.find(params[:id])
      respond_with(@m_person)
    end

    def new
      @m_person = MPerson.new
      respond_with(@m_person)
    end

    def create
      @m_person = MPerson.new(params[:m_field])
      respond_with(@m_person) do |format|
        if @m_person.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_person = MPerson.find(params[:id])

      respond_with(@m_person) do |format|
        if @m_person.update_attributes(params[:m_field])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_person = MPerson.find(params[:id])
      @m_person.destroy
      respond_with(@m_person)
    end

  end
end