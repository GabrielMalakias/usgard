App.sensor = (function() {
  var config = { container: "display_box", channel: "actuator", user: "usgard", socket: null };

  function init(configuration) {
    config =  Object.assign({}, config, configuration);
    config.socket = App.channel.init({identifiers: identifier(), functions: subscriptionFunctions()});

    addListeners();
    true
  }

  function addListeners() {
    return getConsoleInput().addEventListener("keydown", function (event) {
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
    return { connected: onConnected, disconnected:  onDisconnected, received: onReceive }
  }

  // These functions will be evaluated when cable trigger the subscriptions
  function onDisconnected() {
    appendMessageToBox({ user: 'system', message: "Connection Lost", system: true });
  }

  function onReceive(data) {
    appendMessageToBox(data);
  }

  function onConnected() {
    appendMessageToBox({ user: 'system', message: "Connection Established", system: true });
  }

  function onEnter() {
    config.socket.perform('speak', { message: getMessageFromConsoleInput() });
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
    node.innerHTML = '<div class="txt">' + incomingMessage + '</div>';
    return node;
  }

  function getMessageBoxElement() {
    return document.getElementById(config.container);
  }

  function appendMessageToBox(incomingMessage) {
    getMessageBoxElement().appendChild(createMessageNode(incomingMessage.message));
  }

  function getConsoleInput() {
    return document.getElementById("console")
  }

  return {
    init: init
  }
}());
