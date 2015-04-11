$ ->
  resorts = $('#tour_resort_ids').html()

  populate_resorts = ->
    options = []
    for country in $('#tour_resort_category_ids').select2('data')
      options.push($(resorts).filter("optgroup[label=#{country.text}]"))
    console.log options
    $('#tour_resort_ids').html(options)
    
  $('select[multiple=multiple]').select2()
  
  $('#tour_resort_category_ids').on 'change', ->
    $('#tour_resort_ids').select2('val', 'All')
    populate_resorts()

  populate_resorts()