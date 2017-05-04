var statusButton = {
  config: {
    button: '#status',
    object: '#display_box'
  },

  init: function () {
    $(document)
        .on('click', statusButton.config.button, statusButton.execute);
  },

  execute: function() {
    if ($(statusButton.config.object).is(':visible')) {
      $(statusButton.config.object).hide();
    } else {
      $(statusButton.config.object).show();
    }
  }
}

var sensor = {
  config: {
    topic: '#mqtt_topic',
    display_box: '#display_box',
    mqttClient: mqttClient.create({host: 'localhost', port: '9001'}, "usgard_" + parseInt(Math.random() * 100, 10))
  },

  init: function () {
    sensor.config.mqttClient.connect({onSuccess: sensor.onConnect});
    sensor.config.mqttClient.onConnectionLost = sensor.onConnectionLost;
    sensor.config.mqttClient.onMessageArrived = sensor.onMessageArrived;
  },

  onConnect: function () {
    console.log("Connected");

    var topic = $(sensor.config.topic).text();
    sensor.config.mqttClient.subscribe(topic);

    console.log("Subscribed " + topic);
  },

  onConnectionLost: function (response) {
    console.log("onConnectionLost: " + response.errorMessage);
  },

  onMessageArrived: function (message) {
    $(sensor.config.display_box).prepend("<p>" + message.payloadString + new Date().toLocaleTimeString() + '</p>');
  }
};

$(document).ready( function () {
  sensor.init();
  statusButton.init();
  deleteButton.init('sensors');
});
