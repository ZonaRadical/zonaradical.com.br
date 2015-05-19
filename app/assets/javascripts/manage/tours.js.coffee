#= require_tree ./../editor
#= require sliders/slick

$ ->
  resorts = $('#tour_resort_ids').html()

  populate_resorts = ->
    options = []
    for country in $('#tour_resort_category_ids').select2('data')
      options.push($(resorts).filter("optgroup[label=#{country.text}]"))
    $('#tour_resort_ids').html(options)
    
  $('select[multiple=multiple]').select2()
  
  $('#tour_resort_category_ids').on 'change', ->
    $('#tour_resort_ids').select2('val', 'All')
    populate_resorts()

  populate_resorts()

  # .index-slider Slick
  $(".tip-slider").slick
    dots: false
    arrows: true
    infinite: true
    speed: 500
    autoplay: false

  $(".froala").editable
    inlineMode: false
    mediaManager:true
    key: 'WlxvxhzxtB-16D-13lD3aliC8du=='
    language: 'pt_br'

  $("#shareTour").dialog
    autoOpen: true
    modal: true

  $('#show_passed').on 'change', ->
    $('#show_passed_form').submit()