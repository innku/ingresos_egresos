$ ->
  $('.datepicker').datepicker(dateFormat: 'dd-mm-yy')
  $('.tags').tagsInput({
    autocomplete_url : '/tags.json'
    autocomplete : { selectFirst: true, width: '100px', autoFill: true, interactive: true }
  })
