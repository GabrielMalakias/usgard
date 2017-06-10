require 'mqtt'

queue = %w(sensor actuator)
ids = 0...10

MQTT::Client.connect(host: 'localhost', port: 1883) do |c|

  while(true)
    value = "#{queue.sample}/#{ids.to_a.sample}"
    puts value

    c.publish(value, Random.rand(1...99999))

    sleep(0.03)
  end
end
