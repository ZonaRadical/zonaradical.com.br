# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


#= require_tree ./editor

$ ->
  $(".froala").editable
    inlineMode: false
    mediaManager:true

  $("#tip_category_name").slug_preview({ slug_selector: '#tip_category_slug' })

  return
