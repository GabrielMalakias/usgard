var mqttClient = {
  create: function(config, identifier) {
    return new Paho.MQTT.Client(config.host, Number(config.port), identifier);
  }
};

