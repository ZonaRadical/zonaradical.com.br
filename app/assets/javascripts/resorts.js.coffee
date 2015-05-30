# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_tree ./editor
#= require sliders/slick

$ ->
  $(".froala").editable
    inlineMode: false
    mediaManager:true
    key: 'WlxvxhzxtB-16D-13lD3aliC8du=='
    language: 'pt_br'

  $('.index-slider').slick
    dots: false,
    arrows: true,
    infinite: true,
    speed: 500,
    autoplay: false

  $("#resort_name").slug_preview({ slug_selector: '#resort_slug' })

  return
