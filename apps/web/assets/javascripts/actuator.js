App.sensor = (function() {
  var config = {
    container: "display_box",
    channel: "actuator",
    userId: "user_id",
    socket: null,
    statusIndicator: '#status_indicator'
  };

  function init(configuration) {
    config =  Object.assign({}, config, configuration);
    config.socket = App.channel.init({
      identifiers: identifier(),
      functions: subscriptionFunctions()}
    );

    addListeners();
    true
  }

  function addListeners() {
    return getConsoleInput()
      .addEventListener("keydown", function (event) {
      if (event.which == 13 || event.keyCode == 13) {
        onEnter();
        return false;
      }
      return true;
    });
  }

  function identifier() {
    return {
      channel: config.channel, id: config.identifier
    };
  }

  function subscriptionFunctions() {
    return { connected: onConnected,
      disconnected: onDisconnected,
      received: onReceive }
  }

  // These functions will be evaluated when cable trigger the subscriptions
  function onDisconnected() {
    Materialize.toast('Connection Lost', 4000);
    appendMessageToBox({ user: 'system',
      message: "Connection Lost",
      system: true
    });
  }

  function onReceive(data) {
    getActuatorStatus().text(data.message);
    appendMessageToBox(data);
  }

  function onConnected() {
    Materialize.toast('Connection Established', 4000);
    appendMessageToBox({ user: 'system',
      message: "Connection Established",
      system: true
    });
  }

  function onEnter() {
    config.socket.perform('speak', {
        message: getMessageFromConsoleInput(),
        user: getUserId().value
      });
  }

  // Create HTML elements
  //
  function getMessageFromConsoleInput() {
    var value = getConsoleInput().value;
    getConsoleInput().value = null;
    return value;
  }

  function createMessageNode(incomingMessage) {
    var node = document.createElement('div');
    node.innerHTML = '<span class="teal-text accent-4-text">' + incomingMessage + '</span>';
    return node;
  }

  function getUserId() {
    return document.getElementById(config.userId)
  }

  function getMessageBoxElement() {
    return document.getElementById(config.container);
  }

  function setActuatorStatus() {
    getActuatorStatus().text(incomingMessage.message);
  }

  function getActuatorStatus() {
    return $(config.statusIndicator);
  }

  function appendMessageToBox(incomingMessage) {
    getMessageBoxElement().prepend(createMessageNode(incomingMessage.message));
  }

  function getConsoleInput() {
    return document.getElementById("console")
  }

  return {
    init: init
  }
}());
