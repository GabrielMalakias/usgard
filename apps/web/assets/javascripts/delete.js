App.delete = (function() {
  var config = { resourceId: null };

  function execute(resourceId, resource) {
    config.resourceId = resourceId;

    $.ajax({
      url: '/' + resource + '/' + resourceId,
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
