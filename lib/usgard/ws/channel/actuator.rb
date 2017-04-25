# frozen_string_literal: true

module Usgard
  module Ws
    class Channel::Actuator < Usgard::Ws::Channel
      identifier :actuator

      def subscribed
        reject unless actuator_id
        stream_from "actuator_#{actuator_id}"
      end

      def speak(data)
        Hanami::Logger.new.info "#{@user} connected"
        LiteCable.broadcast "actuator_#{actuator_id}", user: user, message: data["message"], sid: sid
      end

      private

      def actuator_id
        @actuator_id ||= params.fetch("id")
      end
    end
  end
end
