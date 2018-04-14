App.delete = (function() {
  var config = { resourceId: null };

  function execute(resourceId, resource, token) {
    config.resourceId = resourceId;

    $.ajax({
      url: '/' + resource + '/' + resourceId  + '?_csrf_token=' + token,
      type: 'DELETE',
      success: onSuccess
    });
  }

  function onSuccess() {
    Materialize.toast('Resource deleted', 4000);
    $('#' + config.resourceId).remove();
  }

  return {
    execute: execute
  }
}());
