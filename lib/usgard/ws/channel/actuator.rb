# frozen_string_literal: true

module Usgard
  module Ws
    class Channel::Actuator < Usgard::Ws::Channel
      #include ::AutoInject['mqtt.client']

      identifier :actuator

      def initialize(connection, identifier, params)
        @connection = connection
        @identifier = identifier
        @params = params.freeze

        @client = MQTT::Client.connect(host: ENV['MQTT_HOST'], username: ENV['MQTT_USER'], password: ENV['MQTT_PASSWORD'], port: ENV['MQTT_PORT'])

        delegate_connection_identifiers
      end


      def subscribed
        reject unless actuator_id

        stream_from "actuator_#{actuator_id}"
      end

      def speak(data)
        Hanami::Logger.new.info "#{@user} connected"
        LiteCable.broadcast "actuator_#{actuator_id}", user: user, message: data["message"], sid: sid
        send_to_mqtt(data['message'], data['user'])
      end

      private

      def send_to_mqtt(message, user_id)
        @client.publish("users/#{user_id}/actuator/#{actuator_id}/send", message)
        @client.disconnect
      end

      def actuator_id
        @actuator_id ||= params.fetch("id")
      end
    end
  end
end
