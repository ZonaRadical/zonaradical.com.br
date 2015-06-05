# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


#= require_tree ./editor

$ ->
  $(".froala").editable
    inlineMode: false
    mediaManager:true
    key: 'WlxvxhzxtB-16D-13lD3aliC8du=='

  $("#resort_category_name").slug_preview({ slug_selector: '#resort_category_slug' })

  return
