App.actuator = (function() {
  var config = {
    container: "display_box",
    channel: "actuator",
    socket: null,
    statusIndicator: '#status_indicator'
  };

  function init(configuration) {
    config =  Object.assign({}, config, configuration);
    config.socket = App.channel.init({
      identifiers: identifier(),
      functions: subscriptionFunctions()}
    );

    addListeners(identifier().id);
    true
  }

  function addListeners(id) {
    var input = getConsoleInput(id);

    switch(input.tagName) {
      case "A":
        input.addEventListener("click", function (event) {
          input.setAttribute('disabled', true);
          onClick(id);

          setTimeout(function() {
            input.removeAttribute('disabled');
          }, 2000)
        });
        break;
      case "INPUT":
        return input.addEventListener("keydown", function (event) {
          if (event.which == 13 || event.keyCode == 13) {
            onEnter(id);
            return false;
          }
          return true;
        });
        break;
      default:
        null;
        break;
    }
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

  function onEnter(id) {
    config.socket.perform('speak', {
        message: getMessageFromConsoleInput(id),
        user: getUserId().text()
      });
  }

  function onClick(id) {
    Materialize.toast('Message sent', 4000);
    var value = $("#switch" + id).text().trim();

    switch(value) {
      case 'flash_on':
        config.socket.perform('speak', { message: 'off' });
        document.getElementById('switch' + id).innerHTML = 'flash_off';
        break;
      case 'flash_off':
        config.socket.perform('speak', { message: 'on' });
        document.getElementById('switch' + id).innerHTML = 'flash_on';
        break;
    }
    return value;
  }

  // Create HTML elements
  //
  function getMessageFromConsoleInput(id) {
    var value = getConsoleInput(id).value;
    getConsoleInput(id).value = null;
    return value;
  }

  function createMessageNode(incomingMessage) {
    var node = document.createElement('div');
    node.innerHTML = '<span class="teal-text accent-4-text">' + incomingMessage + '</span>';
    return node;
  }

  function getUserId() {
    return $(config.userId).text();
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

  function getConsoleInput(id) {
    return document.getElementById("console" + id)
  }

  return {
    init: init
  }
}());
