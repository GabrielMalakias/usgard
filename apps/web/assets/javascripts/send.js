var actuator = {
  config: {
   topic: '#mqtt_topic',
    display_box: '#display_box',
    mqttClient: null
  },

  init: function (client) {
    actuator.config.mqttClient = client;

    actuator.config.mqttClient.connect({onSuccess: actuator.onConnect});
    actuator.config.mqttClient.onConnectionLost = actuator.onConnectionLost;
    actuator.config.mqttClient.onMessageArrived = actuator.onMessageArrived;
  },

  onConnect: function () {
    console.log("Connected");

    var topic = $(actuator.config.topic).text();
    actuator.config.mqttClient.subscribe(topic);

    console.log("Subscribed " + topic);
  },

  onConnectionLost: function (response) {
    console.log("onConnectionLost: " + response.errorMessage);
  },

  onMessageArrived: function (message) {
    $(actuator.config.display_box).prepend("<p>" + message.payloadString + new Date().toLocaleTimeString() + '</p>');
  }
}

var createClient = {
  config: {
    host: 'localhost',
    port: '9001',
  },

  identifier: function() {
    return "usgard_" + parseInt(Math.random() * 100, 10);
  },

  execute: function() {
    return mqttClient.create(createClient.config, createClient.identifier());
  }
}

var sendButton = {
  config: {
    button: '#send',
    object: '#msg',
    client: null,
    topic: null
  },
  init: function(client) {
    sendButton.config.client = client;

    $(document)
        .on('click', sendButton.config.button, sendButton.execute);
  },
  getMessage: function() {
    var message = new Paho.MQTT.Message($(sendButton.config.object).val());
    message.destinationName = $(actuator.config.topic).text();

    return message;
  },
  execute: function() {
    sendButton.config.client.send(sendButton.getMessage());
  }
}

$(document).ready( function () {
  var client = createClient.execute();

  actuator.init(client);
  sendButton.init(client);
});
