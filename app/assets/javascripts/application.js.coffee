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

  $("form#sign_in_user, form#sign_up_user").bind("ajax:success", (event, xhr, settings) ->
    window.location.reload()
    $( "#signIn" ).dialog( "close" );
  ).bind("ajax:error", (event, xhr, settings, exceptions) ->
    error_messages = if xhr.responseJSON['error']
      "<div class='alert alert-danger pull-left'>" + xhr.responseJSON['error'] + "</div>"
    else if xhr.responseJSON['errors']
      $.map(xhr.responseJSON["errors"], (v, k) ->
        "<div class='alert alert-danger pull-left'>" + k + " " + v + "</div>"
      ).join ""
    else
      "<div class='alert alert-danger pull-left'>Unknown error</div>"
    $(this).parents('#signIn').children('.modal-footer').html(error_messages)
  )

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

((d, s, id) ->
  js = undefined
  fjs = d.getElementsByTagName(s)[0]
  if d.getElementById(id)
    return
  js = d.createElement(s)
  js.id = id
  js.src = '//connect.facebook.net/en_US/all.js#xfbml=1'
  fjs.parentNode.insertBefore js, fjs
  return
) document, 'script', 'facebook-jssdk'