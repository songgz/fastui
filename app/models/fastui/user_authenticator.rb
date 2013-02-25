# encoding: utf-8
module Fastui
  class UserAuthenticator
    def initialize(user)
      @user = user
    end

    def authenticate(unencrypted_password)
      return false unless @user
      if @user.password == unencrypted_password
        @user
      else
        false
      end

    end
  end
end
