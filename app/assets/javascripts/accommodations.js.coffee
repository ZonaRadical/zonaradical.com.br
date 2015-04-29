#= require_tree ./editor
#= require sliders/slick

$ ->
  $(".froala").editable
    inlineMode: false
    mediaManager:true