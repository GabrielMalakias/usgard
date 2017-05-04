var deleteButton = {
  config: {
    button: '#delete',
    object: '#id',
    resource: null
  },

  init: function (resource) {
    deleteButton.config.resource = resource;

    $(document)
      .on('click', deleteButton.config.button, deleteButton.execute);
  },

  execute: function() {
    var id  = $(deleteButton.config.object).text();
    $.ajax({
      url: '/' + deleteButton.config.resource +  '/' + id,
      type: 'DELETE',
      success: function(result) {
        document.location.href = '/' + deleteButton.config.resource;
      }
    });
  }
}

