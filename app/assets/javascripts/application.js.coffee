# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.

#= require_tree ./shared
#= require jquery
#= require jquery-ui
#= require jquery_ujs
#= require forem

# Запускаем когда страница готова | trigger when page is ready
$(document).ready ->

  #Scroll to-top
  $("a.to-top").click ->
    $("html, body").animate
      scrollTop: 0
    , "slow"
    return

  $("a[href=#]").click (e) ->
    e.preventDefault()
    return

  $("#signIn").dialog
    autoOpen: false
    modal: true

  $("span.signIn-dialog").click ->
    $("#signIn").dialog "open"
    return

  return


# Другие события | optional triggers
#
# $(window).load(function() { // Когда страница полностью загружена
#
# });
#
# $(window).resize(function() { // Когда изменили размеры окна браузера
#
# });
#
#
$(".flash").fadeIn ->
  setTimeout (->
    $(".flash").fadeOut()
    return
  ), "5000"
  return