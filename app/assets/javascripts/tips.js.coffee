# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_tree ./editor
#=require sliders/slick

$ ->
  $(".froala").editable
    inlineMode: false
    mediaManager:true
    key: 'WlxvxhzxtB-16D-13lD3aliC8du=='
    language: 'pt_br'

  $("#tabs").tabs()


  # .index-slider Slick
  $(".tip-slider").slick
    dots: false
    arrows: true
    infinite: true
    speed: 500
    autoplay: false

  $("#tip_title").slug_preview({ slug_selector: '#tip_slug' })

  return
