// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require modernizr.custom
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require_tree .
//= require forem
//= require inclusions


//= require froala_editor.min.js
//= require plugins/block_styles.min.js
// = require plugins/colors.min.js
// = require plugins/media_manager.min.js
// = require plugins/tables.min.js
// = require plugins/video.min.js
// = require plugins/font_family.min.js
// = require plugins/font_size.min.js
// = require plugins/file_upload.min.js
// = require plugins/lists.min.js
// = require plugins/char_counter.min.js

/* Запускаем когда страница готова | trigger when page is ready */
$(document).ready(function(){


    // .index-slider Slick
    $('.index-slider').slick({
        dots: false,
        arrows: true,
        infinite: true,
        speed: 500,
        autoplay: false
    });

    // .news-slider Slick
    $('.news-slider').slick({
        dots: false,
        arrows: true,
        infinite: false,
        speed: 500,
        autoplay: false,
        vertical: true,
        slidesToShow: 3,
        slidesToScroll: 1
    });

    var news_slider = $('.news-slider');
    $('.slick-next').click(function(){
        if(!news_slider.find('.slide').last().hasClass('.slick-active')) {
            news_slider.find('.slide').removeClass('no-border');
            news_slider.find('.slick-active').first().addClass('no-border');
        }
    });
    $('.slick-prev').click(function(){
        if(!news_slider.find('.slide').first().hasClass('.slick-active')) {
            news_slider.find('.slide').removeClass('no-border');
            news_slider.find('.slick-active').first().addClass('no-border');
        }
    });

    //Scroll to-top
    $('a.to-top').click(function(){
        $("html, body").animate({scrollTop:0},"slow");
    });



    $('a[href=#]').click(function(e){ e.preventDefault(); });

    $( "#signIn" ).dialog({ autoOpen: false, modal: true });
    $( "span.signIn-dialog" ).click(function() {
        $( "#signIn" ).dialog( "open" );
    });

});


/* Другие события | optional triggers

 $(window).load(function() { // Когда страница полностью загружена

 });

 $(window).resize(function() { // Когда изменили размеры окна браузера

 });

 */

$('.flash').fadeIn(function() {
    setTimeout(function() {
        $('.flash').fadeOut();
    }, '5000');
});
