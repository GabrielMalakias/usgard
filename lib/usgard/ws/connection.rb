# frozen_string_literal: true

module Usgard
  module Ws
    class Connection < LiteCable::Connection::Base
      identified_by :user, :sid

      def connect
        @user = 'usgard' #cookies["user"]
        @sid = request.params["sid"]
        reject_unauthorized_connection unless @user
        Hanami::Logger.new.info "#{@user} connected"
      end

      def disconnect
        Hanami::Logger.new.info "#{@user} disconnected"
      end
    end
  end
end
