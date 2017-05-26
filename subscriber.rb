require 'rubygems'
require 'mqtt'

client = MQTT::Client.connect(host: 'localhost', port: 1883)


client.subscribe("sensor/system")
client.get do |topic, message|
  puts message
end

