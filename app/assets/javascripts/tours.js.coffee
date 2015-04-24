#= require_tree ./editor

$ ->
  $(".froala").editable
    inlineMode: false
    mediaManager:true

  # SELECT stylization 
  $('.select').click ->
    select_wrap = $(this).closest('.select-wrap')
    option_list = select_wrap.find('.option-list')
    if option_list.is(':visible')
      option_list.slideUp 'fast'
      $(this).find('.arrow').removeClass 'active'
    else
      if $('.select-wrap .option-list:visible').length
        $('.select-wrap .option-list:visible').hide()
        $('.select-wrap .arrow').removeClass 'active'
      option_list.slideDown 'fast'
      $(this).find('.arrow').addClass 'active'
    return
  $('.option-list li').click ->
    title = $(this).closest('.select-wrap').find('.select .name')
    option = $(this).html()
    $(this).closest('.select-wrap').find('input[type=hidden]').val $(this).attr('data-value')
    title.empty()
    title.html option
    $(this).closest('.option-list').slideUp 300
    $(this).closest('.select-wrap').find('.arrow').removeClass 'active'
    return
  $(document).click (e) ->
    if $('.select-wrap .option-list:visible').length and !$(e.target).closest('.select-wrap').length
      $('.select-wrap .option-list').slideUp 300
      $('.select-wrap .arrow').removeClass 'active'
    return
  $(document).keyup (e) ->
    if e.keyCode == 27
      $('.select-wrap .option-list').slideUp 300
    return
  $('.select-wrap').each ->
    value = $(this).find('input[type=hidden]').val()
    if value != ""
      $(this).find(".option-list li[data-value='#{value}']").click()
    return