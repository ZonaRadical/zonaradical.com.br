# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


#//= require inclusions
#=require sliders/slick

$ ->
  # .index-slider Slick
  $(".index-slider").slick
    dots: false
    arrows: true
    infinite: true
    speed: 500
    autoplay: false


  # .news-slider Slick
  $(".news-slider").slick
    dots: false
    arrows: true
    infinite: false
    speed: 500
    autoplay: false
    vertical: true
    slidesToShow: 3
    slidesToScroll: 1

  news_slider = $(".news-slider")
  $(".slick-next").click ->
    unless news_slider.find(".slide").last().hasClass(".slick-active")
      news_slider.find(".slide").removeClass "no-border"
      news_slider.find(".slick-active").first().addClass "no-border"
    return

  $(".slick-prev").click ->
    unless news_slider.find(".slide").first().hasClass(".slick-active")
      news_slider.find(".slide").removeClass "no-border"
      news_slider.find(".slick-active").first().addClass "no-border"
    return
