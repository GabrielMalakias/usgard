require "rack"
require "anycable"
require "litecable"
require 'rubygems'
require 'mqtt'

MQTT::Client.connect(host: ENV['MQTT_HOST'], username: ENV['MQTT_USER'], password: ENV['MQTT_PASSWORD'], port: ENV['MQTT_PORT']) do |c|
  while true
    (0..4).to_a.sample.tap do |id|
      c.publish("actuator/#{id}", Random.rand(10000))
    end

    (0..4).to_a.sample.tap do |id|
      c.publish("sensor/#{id}", Random.rand(10000))
    end

    sleep(0.2)
  end
end


