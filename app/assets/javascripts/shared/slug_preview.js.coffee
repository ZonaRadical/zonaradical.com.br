$.fn.extend
  slug_preview: (options) ->
    $(this).focusout ->
      element = $(this)
      value = element.val()
      slug_selector = options.slug_selector

      if (value != '')
        $.ajax
         url: element.data('url')
         data: { title: value }
         success: (data) ->
           $(slug_selector).val(data.slug)
      else
        $(slug_selector).val('')
