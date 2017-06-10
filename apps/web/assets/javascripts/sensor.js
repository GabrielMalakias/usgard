App.sensor = (function() {
  var config = { container: "status_indicator", channel: "sensor", user: "usgard" };

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
    appendMessageToBox('Down');
    Materialize.toast('Connection Lost', 4000);
  }

  function onReceive(data) {
    appendMessageToBox(data.message);
  }

  function onConnected() {
    appendMessageToBox('Waiting');
    Materialize.toast('Connection Established', 4000);
  }

  // Create HTML elements
  function getStatusBoxElement() {
    return $('#' + config.container);
  }

  function appendMessageToBox(incomingMessage) {
    getStatusBoxElement().text(incomingMessage);
  }

  return {
    init: init
  }
}());
