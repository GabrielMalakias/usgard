require "rack"
require "anycable"
require "litecable"
require 'mqtt'
#require_relative './config/boot'

LiteCable.anycable!

client = MQTT::Client.connect(host: 'localhost', port: 1883)


while true

  client.publish('actuator/2', ['on', 'off'].sample)
  client.publish('sensor/1', Random.rand(20))

  sleep(0.500)

end
