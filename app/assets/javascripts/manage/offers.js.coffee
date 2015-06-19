#= require_tree ./../editor
#= require sliders/slick

$ ->
  resorts = $('#offer_resort_ids').html()

  populate_resorts = ->
    options = []
    for country in $('#offer_resort_category_ids').select2('data')
      options.push($(resorts).filter("optgroup[label=#{country.text}]"))
    $('#offer_resort_ids').html(options)
    
  $('select[multiple=multiple]').select2()
  
  $('#offer_resort_category_ids').on 'change', ->
    $('#offer_resort_ids').select2('val', 'All')
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

  $('#show_passed').on 'change', ->
    $('#show_passed_form').submit()