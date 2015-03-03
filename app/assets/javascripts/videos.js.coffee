# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#=require shared/underscore

getYoutubeId = (url) ->
  regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
  match = url.match(regExp)
  if match and match[2].length is 11
    match[2]
  else
    -1

getVimeoId = (url)->
  url = url.replace(/^https?:\/\/vimeo.com\//,'')

updateVideo = (url)->
  if url.indexOf("youtube") > -1
    youTubeId = getYoutubeId(url)
    if youTubeId != -1
      $(".youtube").attr("src", "http://www.youtube.com/embed/" + youTubeId + "?rel=0&autoplay=0").show()
    else
      $(".youtube").hide()
    return
  else
    vimeoId = getVimeoId(url)
    $(".vimeo").attr("src", "//player.vimeo.com/video/" + vimeoId).show()

$("#video_source").change ->
  $(".youtube").hide()
  $(".vimeo").hide()
  return
$("#video_source_link").change ->
  updateVideo $(this).val()
  return
