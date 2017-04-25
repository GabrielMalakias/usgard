App.sensor = (function() {
  var config = { container: "display_box", channel: "sensor", user: "usgard" };

  function init(configuration) {
    config =  Object.assign({}, config, configuration);

    App.channel.init({identifiers: identifier(), functions: subscriptionFunctions()});
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

  function onReceive() {
    appendMessageToBox(data);
  }

  function onConnected() {
    appendMessageToBox({ user: 'system', message: "Connection Established", system: true });
  }

  // Create HTML elements
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

  return {
    init: init
  }
}());
