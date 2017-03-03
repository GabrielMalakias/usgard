 // client = new Paho.MQTT.Client('localhost', Number('9001'), "usgard_" + parseInt(Math.random() * 100, 10));
 //
 // client.onConnectionLost = onConnectionLost;
 // client.onMessageArrived = onMessageArrived;
 //
 // // connect the client
 // client.connect({onSuccess:onConnect});
 //
 // // called when the client connects
 // function onConnect() {
 //   // Once a connection has been made, make a subscription and send a message.
 //   console.log("onConnect");
 //   client.subscribe("test");
 //   message = new Paho.MQTT.Message("Hello");
 //   message.destinationName = "World";
 //   client.send(message);
 // }
 //
 // // called when the client loses its connection
 // function onConnectionLost(responseObject) {
 //   if (responseObject.errorCode !== 0) {
 //     console.log("onConnectionLost:"+responseObject.errorMessage);
 //   }
 // }
 //
 // // called when a message arrives
 // function onMessageArrived(message) {
 //   console.log("onMessageArrived:"+message.payloadString);
 // }
 //

var sensor = {
  init: function (topic) {
    this.client.onConnectionLost = this.onConnectionLost;
    this.client.onMessageArrived = this.onMessageArrived;

    this.client.subscribe(topic);
  },
  client: new Paho.MQTT.Client('localhost', Number('9001'), "usgard_" + parseInt(Math.random() * 100, 10)),

  onConnectionLost: function (response) {
    console.log("onConnectionLost: " + response.errorMessage);
  },
  onMessageArrived: function (message) {
    console.log("onMessageArrived: " + message.payloadString);
  }
};


