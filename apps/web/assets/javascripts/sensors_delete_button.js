var deleteButton = {
  config: {
    button: '#delete',
    object: '#sensorid'
  },

  init: function () {
    $(document)
      .on('click', deleteButton.config.button, deleteButton.execute);
  },

  execute: function() {
    var id  = $(deleteButton.config.object).text();
    $.ajax({
      url: '/sensors/' + id,
      type: 'DELETE',
      success: function(result) {
        document.location.href = '/sensors'
      }
    });
  }
}

$(document).ready( function () {
  deleteButton.init();
});
