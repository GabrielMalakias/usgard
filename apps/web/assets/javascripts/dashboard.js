App.dashboard = (function() {
  var cable = App.channel.createCable();
  var config = { sensors: [], actuators: [] };

  function init() {
    initSensors();
    initActuators();
  }

  function initActuators() {
    config.actuators.forEach(function (item) {
      addSubscription(item, 'actuator')
    });
  }

  function initSensors() {
    config.sensors.forEach(function (id) {
      addSubscription(id, 'sensor')
    });
  }

  function addSubscription(id, channel) {
    var functions = { connected: createConnectedFunction(id, channel), disconnected: createDisconnectedFunction(id, channel), received: createReceiveFunction(id, channel) };
    var identifier = { channel: channel, id: id };

    var subscription = cable.subscriptions.create(identifier, functions);
    if(channel == 'actuator')  {
      addListener(id, subscription)
    }
  }

  function addIdentifier(identifier, type) {
    if(type == "sensor") {
      config.sensors.push(identifier)
    } else {
      config.actuators.push(identifier)
    }
  }

  function addListener(id, subscription) {
    return getConsoleInput(id).addEventListener("keydown", function (event) {
      if (event.which == 13 || event.keyCode == 13) {
        onEnter(id, subscription);
        return false;
      }
      return true;
    });
  }

  function onEnter(id, subscription) {
    Materialize.toast('Message sent', 4000);
    var value = getConsoleInput(id).value;
    subscription.perform('speak', { message: getConsoleInput(id).value });
    getConsoleInput(id).value = null;
    return value;
  }

  function createConnectedFunction(id, channel) {
    return function () {
      setItemStatus(id, channel, "Waiting");
    }
  }

  function createDisconnectedFunction(id, channel) {
    return function () {
      setItemStatus(id, channel, "Down");
    }
  }

  function createReceiveFunction(id, channel) {
    return function (data) {
      setItemStatus(id, channel, data.message);
    }
  }

  function setItemStatus(id, channel, message) {
    getItemById(id, channel).text(message);
  }

  function getItemById(id, channel) {
    return $('#' + channel + id);
  }

  function getConsoleInput(id) {
    return document.getElementById("console" + id);
  }

  return {
    init: init,
    addIdentifier: addIdentifier
  }
}());
