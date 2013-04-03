require_dependency "fastui/application_controller"

module Fastui
  class MCommentsController < ApplicationController
    respond_to :html, :xml, :json
    def index
      @m_comments = MComment.scoped
      data = paginate(@m_comments)
      respond_with(data)
    end

    def show
      @m_comment = MComment.find(params[:id])
      respond_with(@m_comment)
    end

    def edit
      @m_comment = MComment.find(params[:id])
      respond_with(@m_comment)
    end

    def new
      @m_comment = MComment.new
      respond_with(@m_comment)
    end

    def create
      @m_comment = MComment.new(params[:m_comment])
      respond_with(@m_comment) do |format|
        if @m_comment.save
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'failure'} }
        end
      end

    end

    def update
      @m_comment = MComment.find(params[:id])

      respond_with(@m_comment) do |format|
        if @m_comment.update_attributes(params[:m_comment])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end
    end

    def destroy
      @m_comment = MComment.find(params[:id])
      @m_comment.destroy
      respond_with(@m_comment)
    end

  end
end