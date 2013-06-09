# encoding: utf-8
require_dependency "fastui/application_controller"

module Fastui
  class SessionsController < ApplicationController
    respond_to :html, :xml, :json
    def login
      klass = params[:type] || 'Fastui::MPerson'
      user = klass.constantize.where(username: params[:username]).first

      respond_with(user) do |format|
        if UserAuthenticator.new(user).authenticate(params[:password])
          format.json { render :json => {:success => true, :msg => 'ok'} }
        else
          format.json { render :json => {:success => false, :msg => 'false'} }
        end
      end

      #if UserAuthenticator.new(user).authenticate(params[:password])
      #  #self.current_user = user
      #  redirect_to '/fastui'
      ##else
      #  flash[:alert] = "Login failed."
      #  render "new"
      #end

    end

    def logout

    end

    # assign them a random one and mail it to them, asking them to change it
    def forgot_password
      klass = params[:type] || 'Fastui::MPerson'
      @user = klass.constantize.where(username:params[:username])
      random_password = Array.new(10).map { (65 + rand(58)).chr }.join
      @user.password = random_password
      @user.save!
      #Mailer.create_and_deliver_password_change(@user, random_password)
    end
  end
end
