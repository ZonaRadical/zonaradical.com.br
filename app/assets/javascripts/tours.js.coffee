#= require_tree ./editor

$ ->
  update_visible_resorts = ->
    resort_category_id = $('input#search_resort_categories').val()
    input_search_resorts = $('input#search_resorts')
    if resort_category_id != ''
      resort_option_list = input_search_resorts.siblings('.option-list')
      resort_option_list.find('li').removeClass('hide')
      resort_option_list_visible = resort_option_list.find("li[data-category-id='#{resort_category_id}']")
      resort_option_list.find('li').not(resort_option_list_visible).not('.default').addClass('hide')
      current_resort = input_search_resorts.siblings('div.select').find('span').html()
      if resort_option_list.find("li:contains(#{current_resort})").hasClass('hide')
        $('input#search_resorts').val('')
        $('input#search_resorts').siblings('div.select').find('span').html('Estação')
    else
      resort_option_list = input_search_resorts.siblings('.option-list')
      resort_option_list.find('li').removeClass('hide')


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
    update_visible_resorts() if $(this).closest('.select-wrap').find('input#search_resort_categories').length != 0
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