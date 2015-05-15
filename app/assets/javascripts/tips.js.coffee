# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_tree ./editor
#=require sliders/slick

$ ->
  $(".froala").editable
    inlineMode: false
    mediaManager:true

  $("#tabs").tabs()


  # .index-slider Slick
  $(".tip-slider").slick
    dots: false
    arrows: true
    infinite: true
    speed: 500
    autoplay: false

  $("#tip_title").focusout ->
    element = $(this)
    value = element.val()

    if (value != '')
      $.ajax
       url: element.data('url')
       data: { title: value }
       success: (data) ->
         $('#tip_slug').val(data.slug)
    else
      $('#tip_slug').val('')

  return
