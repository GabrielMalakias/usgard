# frozen_string_literal: true
module Usgard
  module Ws
    class Channel::Sensor < Usgard::Ws::Channel
      identifier :sensor

      def subscribed
        reject unless sensor_id
        stream_from "sensor_#{sensor_id}"
      end

      def speak(data)
        Hanami::Logger.new.info "#{sensor_id} connected"
        LiteCable.broadcast "sensor_#{sensor_id}", user: user, message: data["message"], sid: sid
      end

      private

      def sensor_id
        params.fetch("id")
      end
    end
  end
end
