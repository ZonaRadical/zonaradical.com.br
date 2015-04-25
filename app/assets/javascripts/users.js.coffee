# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#=require sliders/slick
#= require_tree ./editor

$ ->
  $("#user_birthday").datepicker({ maxDate: "-1d" })
  $("#tabs").tabs()
  $(".tip-slider").slick
    dots: false
    arrows: true
    infinite: true
    speed: 500
    autoplay: false

  $(".froala").editable
    inlineMode: false
    mediaManager:true
  return
