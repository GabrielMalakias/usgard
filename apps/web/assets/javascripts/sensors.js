var button = {
  active: false,
  config: {
    button: '#status',
    object: '#display_box'
  },
  init: function () {
    $(document)
      .on('click', button.config.button, button.execute);
  },
  execute: function() {
    if (button.active == false) {
      button.active = true;
      $(button.config.object).show();
    } else {
      $(button.config.object).hide();
      button.active = false;
    }
  }
}

var sensor = {
  config: {
    topic: '#mqtt_topic',
    display_box: '#display_box',
    mqttClient: null
  },
  init: function () {

    sensor.client().connect({onSuccess: sensor.onConnect});

    sensor.client().onConnectionLost = sensor.onConnectionLost;
    sensor.client().onMessageArrived = sensor.onMessageArrived;
  },
  onConnect: function () {
    console.log("Connected");

    var topic = $(sensor.config.topic).text();
    sensor.client().subscribe(topic);
    console.log("Subscribed " + topic);
  },
  onConnectionLost: function (response) {
    console.log("onConnectionLost: " + response.errorMessage);
  },
  onMessageArrived: function (message) {
    $(sensor.config.display_box).prepend("<p>" + message.payloadString + new Date().toLocaleTimeString() + '</p>');
  },
  client: function () {
    if (sensor.mqttClient == null) {
      sensor.mqttClient = new Paho.MQTT.Client('localhost', Number('9001'), "usgard_" + parseInt(Math.random() * 100, 10));
    }
    return sensor.mqttClient;
  }
};

$( document ).ready( function () { sensor.init(); button.init(); });
