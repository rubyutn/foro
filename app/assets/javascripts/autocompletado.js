jQuery(function($) {
  $(document).on('focus', '[data-autocomplete-url]:not(.ui-autocomplete-input)', function() {
    var input = $(this)
    input.autocomplete({
      source: function(request, response) {
        $.ajax({
          url:      input.data('autocomplete-url'),
          data:     { q: request.term },
          dataType: 'json',
          success:  function(data) {
            response(
              $.map(data, function(item) {
                return { label: item.label || item.nombre, object: item }
              })
            )
          },
        })
      },
      select: function(event, ui) {
        input.val(ui.item.label)
        $(input.data('autocomplete-for')).val(ui.item.object.id)
      }
    })
  })
})
