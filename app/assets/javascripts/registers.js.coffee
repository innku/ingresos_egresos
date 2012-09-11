$ ->
  $('.datepicker').datepicker(dateFormat: 'dd-mm-yy')
  $('.link-to').bind 'click', ->
    window.location =  $(this).data('url')

